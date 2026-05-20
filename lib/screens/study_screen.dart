import 'package:flutter/material.dart';
import '../models/word_card.dart';
import '../services/db_service.dart';
import '../services/srs_engine.dart';
import '../services/tts_service.dart';
import '../theme/app_theme.dart';
import '../widgets/flashcard_widget.dart';
import 'add_word_screen.dart';
import 'settings_screen.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  List<WordCard> _queue   = [];
  int  _index             = 0;
  bool _loading           = true;
  SrsStats? _stats;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);
    final cards = await DbService.instance.getDueCards();
    final stats = await SrsEngine.instance.getTodayStats();
    setState(() {
      _queue   = cards;
      _index   = 0;
      _stats   = stats;
      _loading = false;
    });
  }

  WordCard? get _current =>
      _queue.isEmpty ? null : _queue[_index % _queue.length];

  // ─────────────────────────────────────────
  //  处理三按钮反馈（接入 SRS 引擎）
  // ─────────────────────────────────────────
  Future<void> _handleReview(ReviewResult result) async {
    final card = _current;
    if (card == null) return;

    await SrsEngine.instance.processReview(card, result);
    _nextCard();
  }

  // ─────────────────────────────────────────
  //  处理左右滑动
  // ─────────────────────────────────────────
  Future<void> _handleSwipe(bool isKnown) async {
    final card = _current;
    if (card == null) return;

    await SrsEngine.instance.processSwipe(card, isKnown);
    _nextCard();
  }

  void _nextCard() {
    setState(() => _index++);
    if (_index >= _queue.length) _loadData();
  }

  FlashcardData _toFlashcardData(WordCard card) {
    return FlashcardData(
      word:     card.word,
      phonetic: card.phonetic,
      meaning:  card.meaning,
      examples: List.generate(
        card.examplesRu.length,
        (i) => ExamplePair(
          ru: card.examplesRu[i],
          zh: card.examplesZh[i],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '🇷🇺 俄语单词',
          style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined,
                color: AppColors.textPrimary),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline,
                color: AppColors.textPrimary),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddWordScreen()),
              );
              _loadData();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                _queue.isEmpty
                    ? '无待复习'
                    : '${_index % _queue.length + 1} / ${_queue.length}',
                style: const TextStyle(color: AppColors.textMuted),
              ),
            ),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // ── 顶部统计栏 ──
                if (_stats != null) _StatsBar(stats: _stats!),

                // ── 主体内容 ──
                Expanded(
                  child: _current == null
                      ? _EmptyState(onRefresh: _loadData)
                      : Center(
                          child: FlashcardWidget(
                            key: ValueKey(_current!.id),
                            data: _toFlashcardData(_current!),
                            onSpeak: () => TtsService.instance
                                .speakClean(_current!.wordForTts),
                            onReview: _handleReview,   // ✅ 接入 SRS
                            onSwipe:  _handleSwipe,    // ✅ 接入 SRS
                          ),
                        ),
                ),
              ],
            ),
    );
  }
}

// ─────────────────────────────────────────────
//  顶部统计栏
// ─────────────────────────────────────────────
class _StatsBar extends StatelessWidget {
  final SrsStats stats;
  const _StatsBar({required this.stats});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color:        AppColors.cardFront,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatItem(
            icon:  Icons.inbox_outlined,
            label: '待复习',
            value: stats.dueToday.toString(),
            color: AppColors.btnHard,
          ),
          _StatDivider(),
          _StatItem(
            icon:  Icons.school_outlined,
            label: '学习中',
            value: stats.learning.toString(),
            color: AppColors.btnGood,
          ),
          _StatDivider(),
          _StatItem(
            icon:  Icons.emoji_events_outlined,
            label: '已掌握',
            value: stats.mastered.toString(),
            color: AppColors.accent,
          ),
          _StatDivider(),
          _StatItem(
            icon:  Icons.library_books_outlined,
            label: '总词数',
            value: stats.totalWords.toString(),
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String   label;
  final String   value;
  final Color    color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color:      color,
            fontSize:   18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color:    AppColors.textMuted,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _StatDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width:  1,
      color:  Colors.white.withOpacity(0.08),
    );
  }
}

// ─────────────────────────────────────────────
//  空状态
// ─────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final VoidCallback onRefresh;
  const _EmptyState({required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🎉', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 16),
          const Text(
            '今日复习全部完成！',
            style: TextStyle(
              color:      AppColors.textPrimary,
              fontSize:   20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '休息一下，明天继续加油',
            style: TextStyle(color: AppColors.textMuted, fontSize: 14),
          ),
          const SizedBox(height: 32),
          OutlinedButton.icon(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh, color: AppColors.accent),
            label: const Text(
              '刷新队列',
              style: TextStyle(color: AppColors.accent),
            ),
          ),
        ],
      ),
    );
  }
}