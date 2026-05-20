import 'package:hive_flutter/hive_flutter.dart';
import '../models/word_card.dart';

class DbService {
  DbService._();
  static final DbService instance = DbService._();

  static const _boxName = 'wordCards';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(WordCardAdapter());
    Hive.registerAdapter(WordCategoryAdapter());
    Hive.registerAdapter(MasteryStatusAdapter());
    await Hive.openBox<WordCard>(_boxName);
  }

  Box<WordCard> get _box => Hive.box<WordCard>(_boxName);

  Future<void> addWord(WordCard card) async {
    await _box.put(card.id, card);
  }

  Future<void> addWords(List<WordCard> cards) async {
    final map = {for (var c in cards) c.id: c};
    await _box.putAll(map);
  }

  Future<void> updateWord(WordCard card) async {
    card.masteryStatus = card.computedMastery;
    await _box.put(card.id, card);
  }

  Future<void> deleteWord(String id) async {
    await _box.delete(id);
  }

  Future<void> toggleStar(WordCard card) async {
    card.isStarred = !card.isStarred;
    await _box.put(card.id, card);
  }

  Future<List<WordCard>> getDueCards({int limit = 50}) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final all = _box.values
        .where((c) => c.nextReviewAt <= now)
        .toList()
      ..sort((a, b) => a.nextReviewAt.compareTo(b.nextReviewAt));
    return all.take(limit).toList();
  }

  Future<List<WordCard>> getByCategory(WordCategory category) async {
    final all = _box.values
        .where((c) => c.category == category)
        .toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return all;
  }

  Future<List<WordCard>> getByMastery(MasteryStatus status) async {
    return _box.values
        .where((c) => c.masteryStatus == status)
        .toList();
  }

  Future<List<WordCard>> search(String query) async {
    if (query.trim().isEmpty) return [];
    final q = query.trim().toLowerCase();
    return _box.values
        .where((c) => c.word.toLowerCase().startsWith(q))
        .take(20)
        .toList();
  }

  Future<List<WordCard>> getAllWords() async {
    final all = _box.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return all;
  }

  Future<List<WordCard>> getStarred() async {
    return _box.values.where((c) => c.isStarred).toList();
  }

  Future<DbStats> getStats() async {
    final all = _box.values.toList();
    final now = DateTime.now().millisecondsSinceEpoch;
    return DbStats(
      total:    all.length,
      dueToday: all.where((c) => c.nextReviewAt <= now).length,
      mastered: all.where((c) => c.masteryStatus == MasteryStatus.mastered).length,
      newWords: all.where((c) => c.masteryStatus == MasteryStatus.newWord).length,
    );
  }

  Stream<BoxEvent> watchAll() => _box.watch();
}

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
