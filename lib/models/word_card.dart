import 'package:isar/isar.dart';

// build_runner 自动生成，不要手动修改
part 'word_card.g.dart';

// ─────────────────────────────────────────────
//  SRS 阶段间隔表（单位：分钟）
//  对应阶段 0-7，共 8 档
// ─────────────────────────────────────────────
const List<int> kSrsIntervalMinutes = [
  5,        // 阶段 0
  30,       // 阶段 1
  720,      // 阶段 2  = 12 小时
  1440,     // 阶段 3  = 1 天
  2880,     // 阶段 4  = 2 天
  5760,     // 阶段 5  = 4 天
  10080,    // 阶段 6  = 7 天
  21600,    // 阶段 7  = 15 天
];

// ─────────────────────────────────────────────
//  词库分类枚举
// ─────────────────────────────────────────────
enum WordCategory {
  daily,      // 日常用语
  travel,     // 旅行
  business,   // 商务
  grammar,    // 语法词
  custom,     // 自定义
}

// ─────────────────────────────────────────────
//  背诵状态枚举
// ─────────────────────────────────────────────
enum MasteryStatus {
  newWord,     // 未学习
  learning,    // 学习中
  reviewing,   // 复习中
  mastered,    // 已掌握（阶段 ≥ 6）
}

// ─────────────────────────────────────────────
//  WordCard — Isar Collection
// ─────────────────────────────────────────────
@collection
class WordCard {
  // Isar 自动管理主键
  Id id = Isar.autoIncrement;

  // ── 核心单词字段 ──

  /// 带 Unicode 重音符（\u0301）的俄语原型，如 "приве́т"
  @Index(type: IndexType.value)
  late String word;

  /// 不含重音符的纯净版本，专门传给 TTS
  /// 存储时自动计算，避免每次播放都临时过滤
  late String wordForTts;

  /// 音标，如 "[prʲɪˈvʲet]"
  late String phonetic;

  /// 精准中文释义
  late String meaning;

  /// 词性，如 "n. / v. / adj."
  late String partOfSpeech;

  // ── 例句（Isar 不支持嵌套 List<Object>，用并行 List 存储） ──

  /// 俄语例句列表（带重音）
  late List<String> examplesRu;

  /// 对应中文翻译列表（与 examplesRu 下标一一对应）
  late List<String> examplesZh;

  // ── SRS 艾宾浩斯字段 ──

  /// 当前阶段 0-7
  @Index()
  int reviewStage = 0;

  /// 下次复习的 Unix 时间戳（毫秒），用于排序
  @Index()
  int nextReviewAt = 0;

  /// 简易度因子，默认 2.5，范围建议 1.3 - 3.0
  double easeFactor = 2.5;

  /// 总复习次数
  int reviewCount = 0;

  /// 连续记住次数（用于判断是否进入 mastered）
  int consecutiveCorrect = 0;

  // ── 分类与状态 ──

  /// 词库大分类
  @Enumerated(EnumType.name)
  WordCategory category = WordCategory.custom;

  /// 背诵状态（由 SRS 引擎自动更新）
  @Enumerated(EnumType.name)
  @Index()
  MasteryStatus masteryStatus = MasteryStatus.newWord;

  /// 是否收藏（星标）
  bool isStarred = false;

  // ── 时间戳 ──

  /// 首次添加时间
  @Index()
  late int createdAt;

  /// 最后复习时间
  int lastReviewedAt = 0;

  // ── 便捷构造函数 ──
  WordCard();

  factory WordCard.create({
    required String word,
    required String phonetic,
    required String meaning,
    required String partOfSpeech,
    required List<String> examplesRu,
    required List<String> examplesZh,
    WordCategory category = WordCategory.custom,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return WordCard()
      ..word = word
      ..wordForTts = stripAccents(word)
      ..phonetic = phonetic
      ..meaning = meaning
      ..partOfSpeech = partOfSpeech
      ..examplesRu = examplesRu
      ..examplesZh = examplesZh
      ..category = category
      ..nextReviewAt = now  // 新词立即可学
      ..createdAt = now;
  }

  // ── 工具方法 ──

  /// 过滤掉 Unicode 组合重音符 U+0301，供 TTS 使用
  static String stripAccents(String text) {
    // U+0301 = 组合用尖音符（Combining Acute Accent）
    return text.replaceAll('\u0301', '');
  }

  /// 当前是否到了复习时间
  @ignore
  bool get isDue {
    return DateTime.now().millisecondsSinceEpoch >= nextReviewAt;
  }

  /// 根据阶段计算 masteryStatus
  @ignore 
  MasteryStatus get computedMastery {
    if (reviewCount == 0) return MasteryStatus.newWord;
    if (reviewStage <= 1) return MasteryStatus.learning;
    if (reviewStage >= 6) return MasteryStatus.mastered;
    return MasteryStatus.reviewing;
  }

  /// 调试用：距离下次复习的可读时间
  @ignore
  String get nextReviewReadable {
    final diff = nextReviewAt - DateTime.now().millisecondsSinceEpoch;
    if (diff <= 0) return '现在';
    final minutes = diff ~/ 60000;
    if (minutes < 60) return '$minutes 分钟后';
    final hours = minutes ~/ 60;
    if (hours < 24) return '$hours 小时后';
    return '${hours ~/ 24} 天后';
  }

  @override
  String toString() =>
      'WordCard(id=$id, word=$word, stage=$reviewStage, '
      'status=$masteryStatus, nextReview=$nextReviewReadable)';
}