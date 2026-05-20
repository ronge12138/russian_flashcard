import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/word_card.dart';

// ─────────────────────────────────────────────
//  DbService — 全局单例，懒加载
// ─────────────────────────────────────────────
class DbService {
  DbService._();
  static final DbService instance = DbService._();

  Isar? _isar;

  /// 必须在 main() 中 await 初始化
  Future<void> init() async {
    if (_isar != null && _isar!.isOpen) return;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [WordCardSchema],
      directory: dir.path,
      name: 'russian_flashcard_db',
      inspector: true, // 开发阶段开启，可用 Isar Inspector 可视化查看
    );
  }

  Isar get _db {
    assert(_isar != null && _isar!.isOpen,
        'DbService.init() must be called before use');
    return _isar!;
  }

  // ─────────────────────────────────────────
  //  写操作
  // ─────────────────────────────────────────

  /// 添加单个单词（AI 返回后调用）
  Future<Id> addWord(WordCard card) async {
    return _db.writeTxn(() => _db.wordCards.put(card));
  }

  /// 批量写入（导入词库时使用）
  Future<List<Id>> addWords(List<WordCard> cards) async {
    return _db.writeTxn(() => _db.wordCards.putAll(cards));
  }

  /// 更新单词（SRS 引擎计算后调用）
  Future<void> updateWord(WordCard card) async {
    // 同时同步 masteryStatus
    card.masteryStatus = card.computedMastery;
    await _db.writeTxn(() => _db.wordCards.put(card));
  }

  /// 删除单个单词
  Future<bool> deleteWord(Id id) async {
    return _db.writeTxn(() => _db.wordCards.delete(id));
  }

  /// 切换收藏状态
  Future<void> toggleStar(WordCard card) async {
    card.isStarred = !card.isStarred;
    await _db.writeTxn(() => _db.wordCards.put(card));
  }

  // ─────────────────────────────────────────
  //  读操作
  // ─────────────────────────────────────────

  /// 获取今日到期的复习卡片（按 nextReviewAt 升序）
  Future<List<WordCard>> getDueCards({int limit = 50}) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    return _db.wordCards
        .filter()
        .nextReviewAtLessThan(now + 1)    // nextReviewAt <= now
        .sortByNextReviewAt()
        .limit(limit)
        .findAll();
  }

  /// 按分类获取所有单词
  Future<List<WordCard>> getByCategory(WordCategory category) async {
    return _db.wordCards
        .filter()
        .categoryEqualTo(category)
        .sortByCreatedAtDesc()
        .findAll();
  }

  /// 按掌握状态过滤
  Future<List<WordCard>> getByMastery(MasteryStatus status) async {
    return _db.wordCards
        .filter()
        .masteryStatusEqualTo(status)
        .sortByNextReviewAt()
        .findAll();
  }

  /// 搜索单词（前缀匹配）
  Future<List<WordCard>> search(String query) async {
    if (query.trim().isEmpty) return [];
    return _db.wordCards
        .filter()
        .wordStartsWith(query.trim(), caseSensitive: false)
        .limit(20)
        .findAll();
  }

  /// 获取全部单词（按创建时间倒序）
  Future<List<WordCard>> getAllWords() async {
    return _db.wordCards.where().sortByCreatedAtDesc().findAll();
  }

  /// 获取收藏单词
  Future<List<WordCard>> getStarred() async {
    return _db.wordCards
        .filter()
        .isStarredEqualTo(true)
        .sortByCreatedAtDesc()
        .findAll();
  }

  // ─────────────────────────────────────────
  //  统计数据（首页 Dashboard 用）
  // ─────────────────────────────────────────
  Future<DbStats> getStats() async {
    final total = await _db.wordCards.count();
    final now = DateTime.now().millisecondsSinceEpoch;
    final dueCount = await _db.wordCards
        .filter()
        .nextReviewAtLessThan(now + 1)
        .count();
    final masteredCount = await _db.wordCards
        .filter()
        .masteryStatusEqualTo(MasteryStatus.mastered)
        .count();
    final newCount = await _db.wordCards
        .filter()
        .masteryStatusEqualTo(MasteryStatus.newWord)
        .count();

    return DbStats(
      total: total,
      dueToday: dueCount,
      mastered: masteredCount,
      newWords: newCount,
    );
  }

  // ─────────────────────────────────────────
  //  监听流（实时更新 UI）
  // ─────────────────────────────────────────

  /// 监听所有卡片变化（词库列表页使用）
  Stream<List<WordCard>> watchAll() {
    return _db.wordCards
        .where()
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true);
  }

  /// 监听到期卡片变化（学习页使用）
  Stream<List<WordCard>> watchDue() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return _db.wordCards
        .filter()
        .nextReviewAtLessThan(now + 1)
        .watch(fireImmediately: true);
  }
}

// ─────────────────────────────────────────────
//  统计数据载体
// ─────────────────────────────────────────────
class DbStats {
  final int total;
  final int dueToday;
  final int mastered;
  final int newWords;

  const DbStats({
    required this.total,
    required this.dueToday,
    required this.mastered,
    required this.newWords,
  });
}