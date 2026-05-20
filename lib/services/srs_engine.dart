import '../models/word_card.dart';
import '../widgets/flashcard_widget.dart'; 
import 'db_service.dart';

// ─────────────────────────────────────────────
//  艾宾浩斯间隔重复引擎
//
//  阶段间隔表：
//  0 → 5分钟    1 → 30分钟   2 → 12小时
//  3 → 1天      4 → 2天      5 → 4天
//  6 → 7天      7 → 15天     8 → 已完全掌握
// ─────────────────────────────────────────────
class SrsEngine {
  SrsEngine._();
  static final SrsEngine instance = SrsEngine._();

  // easeFactor 边界值
  static const double _minEase = 1.3;
  static const double _maxEase = 3.0;

  // ─────────────────────────────────────────
  //  核心：处理用户反馈，更新 WordCard
  // ─────────────────────────────────────────
  Future<void> processReview(WordCard card, ReviewResult result) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    card.reviewCount++;
    card.lastReviewedAt = now;

    switch (result) {
      case ReviewResult.hard:
        _processHard(card);
        break;
      case ReviewResult.good:
        _processGood(card);
        break;
      case ReviewResult.easy:
        _processEasy(card);
        break;
    }

    // 同步更新 masteryStatus
    card.masteryStatus = card.computedMastery;

    // 持久化到 Isar
    await DbService.instance.updateWord(card);
  }

  // ─────────────────────────────────────────
  //  太难：重置到阶段 0，5 分钟后再复习
  // ─────────────────────────────────────────
  void _processHard(WordCard card) {
    card.reviewStage        = 0;
    card.consecutiveCorrect = 0;
    // easeFactor 降低
    card.easeFactor = (card.easeFactor - 0.2).clamp(_minEase, _maxEase);
    card.nextReviewAt = _nextTime(0);
  }

  // ─────────────────────────────────────────
  //  模糊：进入下一阶段
  // ─────────────────────────────────────────
  void _processGood(WordCard card) {
    card.consecutiveCorrect++;

    if (card.reviewStage < kSrsIntervalMinutes.length - 1) {
      card.reviewStage++;
    }
    // easeFactor 轻微提升
    card.easeFactor = (card.easeFactor + 0.05).clamp(_minEase, _maxEase);
    card.nextReviewAt = _nextTime(card.reviewStage, card.easeFactor);
  }

  // ─────────────────────────────────────────
  //  太简单：跳跃阶段 +2，大幅提升 easeFactor
  // ─────────────────────────────────────────
  void _processEasy(WordCard card) {
    card.consecutiveCorrect++;

    card.reviewStage = (card.reviewStage + 2)
        .clamp(0, kSrsIntervalMinutes.length - 1);
    // easeFactor 显著提升
    card.easeFactor = (card.easeFactor + 0.15).clamp(_minEase, _maxEase);
    card.nextReviewAt = _nextTime(card.reviewStage, card.easeFactor);
  }

  // ─────────────────────────────────────────
  //  计算下次复习时间戳
  //  高阶段时用 easeFactor 放大间隔
  // ─────────────────────────────────────────
  int _nextTime(int stage, [double easeFactor = 2.5]) {
    final baseMinutes = kSrsIntervalMinutes[
        stage.clamp(0, kSrsIntervalMinutes.length - 1)];

    // 阶段 3 以上开始受 easeFactor 影响
    final multiplier = stage >= 3 ? easeFactor : 1.0;
    final actualMinutes = (baseMinutes * multiplier).round();

    return DateTime.now().millisecondsSinceEpoch +
        actualMinutes * 60 * 1000;
  }

  // ─────────────────────────────────────────
  //  左右滑快捷操作
  //  右滑（认识） = good
  //  左滑（不认识）= hard
  // ─────────────────────────────────────────
  Future<void> processSwipe(WordCard card, bool isKnown) async {
    await processReview(
      card,
      isKnown ? ReviewResult.good : ReviewResult.hard,
    );
  }

  // ─────────────────────────────────────────
  //  获取今日学习统计
  // ─────────────────────────────────────────
  Future<SrsStats> getTodayStats() async {
    final stats = await DbService.instance.getStats();
    return SrsStats(
      totalWords:   stats.total,
      dueToday:     stats.dueToday,
      mastered:     stats.mastered,
      newWords:     stats.newWords,
      learning:     stats.total - stats.mastered - stats.newWords,
    );
  }
}

// ─────────────────────────────────────────────
//  统计数据载体
// ─────────────────────────────────────────────
class SrsStats {
  final int totalWords;
  final int dueToday;
  final int mastered;
  final int newWords;
  final int learning;

  const SrsStats({
    required this.totalWords,
    required this.dueToday,
    required this.mastered,
    required this.newWords,
    required this.learning,
  });
}