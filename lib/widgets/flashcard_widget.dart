import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// ─────────────────────────────────────────────
//  数据载体（Step 2 替换为真实 Isar 模型）
// ─────────────────────────────────────────────
class FlashcardData {
  final String word;        // 带重音符的俄语原型，如 "ма́ма"
  final String phonetic;    // 音标，如 "[ˈmamə]"
  final String meaning;     // 中文释义
  final List<ExamplePair> examples;

  const FlashcardData({
    required this.word,
    required this.phonetic,
    required this.meaning,
    required this.examples,
  });
}

class ExamplePair {
  final String ru; // 带重音的俄语例句
  final String zh; // 中文翻译
  const ExamplePair({required this.ru, required this.zh});
}

// 三种复习反馈
enum ReviewResult { hard, good, easy }

// ─────────────────────────────────────────────
//  FlashcardWidget
// ─────────────────────────────────────────────
class FlashcardWidget extends StatefulWidget {
  final FlashcardData data;
  final VoidCallback? onSpeak;
  final void Function(ReviewResult)? onReview; // Step 5 接入 SRS 引擎
  final void Function(bool isKnown)? onSwipe;  // 左右滑结果回调

  const FlashcardWidget({
    super.key,
    required this.data,
    this.onSpeak,
    this.onReview,
    this.onSwipe,
  });

  @override
  State<FlashcardWidget> createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget>
    with SingleTickerProviderStateMixin {
  // ── 翻转动画 ──
  late final AnimationController _flipCtrl;
  late final Animation<double> _flipAnim;
  bool _showBack = false;

  // ── 拖拽偏移（左右滑效果） ──
  double _dragOffsetX = 0;
  static const _swipeThreshold = 100.0;

  @override
  void initState() {
    super.initState();
    _flipCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 480),
    );
    _flipAnim = CurvedAnimation(
      parent: _flipCtrl,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _flipCtrl.dispose();
    super.dispose();
  }

  // ── 触发翻转 ──
  void _toggleFlip() {
    if (_flipCtrl.isAnimating) return;
    if (_showBack) {
      _flipCtrl.reverse();
    } else {
      _flipCtrl.forward();
    }
    setState(() => _showBack = !_showBack);
  }

  // ── 重置卡片到正面（换一张时调用） ──
  void reset() {
    _flipCtrl.value = 0;
    setState(() {
      _showBack = false;
      _dragOffsetX = 0;
    });
  }

  // ─────────────────────────────────────────
  //  Build
  // ─────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 点击翻转
      onTap: _toggleFlip,
      // 左右滑
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _flipAnim,
        builder: (_, __) {
          final angle = _flipAnim.value * math.pi;
          final isBackVisible = _flipAnim.value > 0.5;

          return Transform.translate(
            // 拖拽时平移，给用户视觉反馈
            offset: Offset(_dragOffsetX, 0),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0012) // 透视深度
                ..rotateY(angle),
              child: isBackVisible
                  ? Transform(
                      // 背面需再旋转 180° 使文字正向
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(math.pi),
                      child: _BackFace(
                        data: widget.data,
                        onSpeak: widget.onSpeak,
                        onReview: widget.onReview,
                      ),
                    )
                  : _FrontFace(
                      data: widget.data,
                      onSpeak: widget.onSpeak,
                    ),
            ),
          );
        },
      ),
    );
  }

  // ─────────────────────────────────────────
  //  手势逻辑
  // ─────────────────────────────────────────
  void _onDragUpdate(DragUpdateDetails d) {
    setState(() => _dragOffsetX += d.delta.dx);
  }

  void _onDragEnd(DragEndDetails d) {
    final vel = d.velocity.pixelsPerSecond.dx;
    final offset = _dragOffsetX;

    if (offset > _swipeThreshold || vel > 600) {
      // 向右滑 → 认识
      _animateSwipeOut(isKnown: true);
    } else if (offset < -_swipeThreshold || vel < -600) {
      // 向左滑 → 不认识
      _animateSwipeOut(isKnown: false);
    } else {
      // 弹回中心
      setState(() => _dragOffsetX = 0);
    }
  }

  void _animateSwipeOut({required bool isKnown}) {
    final targetX = isKnown ? 500.0 : -500.0;
    // 用 AnimatedContainer 的简单补间实现飞出
    setState(() => _dragOffsetX = targetX);
    Future.delayed(const Duration(milliseconds: 300), () {
      widget.onSwipe?.call(isKnown);
      // 调用方负责换下一张并调用 reset()
    });
  }
}

// ─────────────────────────────────────────────
//  正面卡片
// ─────────────────────────────────────────────
class _FrontFace extends StatelessWidget {
  final FlashcardData data;
  final VoidCallback? onSpeak;

  const _FrontFace({required this.data, this.onSpeak});

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      color: AppColors.cardFront,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 俄语单词（带重音符，字体支持 combining accent）
          Text(
            data.word,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              letterSpacing: 1.5,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // 朗读按钮
          _SpeakButton(onSpeak: onSpeak),

          const SizedBox(height: 40),

          // 提示文字
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.touch_app_outlined,
                  size: 16, color: AppColors.textMuted),
              SizedBox(width: 6),
              Text(
                '点击翻转查看释义',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.swipe, size: 16, color: AppColors.textMuted),
              SizedBox(width: 6),
              Text(
                '左滑不认识  ·  右滑认识',
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  背面卡片
// ─────────────────────────────────────────────
class _BackFace extends StatelessWidget {
  final FlashcardData data;
  final VoidCallback? onSpeak;
  final void Function(ReviewResult)? onReview;

  const _BackFace({
    required this.data,
    this.onSpeak,
    this.onReview,
  });

  @override
  Widget build(BuildContext context) {
    return _CardShell(
      color: AppColors.cardBack,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── 顶部：单词 + 朗读 ──
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.word,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 8),
              _SpeakButton(onSpeak: onSpeak, size: 20),
            ],
          ),
          const SizedBox(height: 6),

          // 音标
          Text(
            data.phonetic,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.accentLight,
              fontStyle: FontStyle.italic,
            ),
          ),

          const _Divider(),

          // 中文释义
          Text(
            data.meaning,
            style: const TextStyle(
              fontSize: 24,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          // 例句列表
          ...data.examples.map((e) => _ExampleTile(pair: e)),

          const SizedBox(height: 24),

          // 三个反馈按钮
          _ReviewButtons(onReview: onReview),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  子组件
// ─────────────────────────────────────────────

/// 统一卡片外壳（圆角 + 阴影）
class _CardShell extends StatelessWidget {
  final Color color;
  final Widget child;

  const _CardShell({required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.88,
      constraints: const BoxConstraints(minHeight: 480, maxHeight: 560),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: AppColors.accent.withOpacity(0.08),
            blurRadius: 60,
            spreadRadius: 4,
          ),
        ],
        border: Border.all(
          color: Colors.white.withOpacity(0.06),
          width: 1,
        ),
      ),
      child: child,
    );
  }
}

/// 朗读按钮
class _SpeakButton extends StatelessWidget {
  final VoidCallback? onSpeak;
  final double size;

  const _SpeakButton({this.onSpeak, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.volume_up_rounded,
          color: AppColors.accentLight, size: size),
      onPressed: onSpeak,
      tooltip: '朗读',
    );
  }
}

/// 分隔线
class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.white.withOpacity(0.15),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}

/// 单条例句
class _ExampleTile extends StatelessWidget {
  final ExamplePair pair;

  const _ExampleTile({required this.pair});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pair.ru,
            style: const TextStyle(
              color: AppColors.accentLight,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            pair.zh,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

/// 底部三个反馈按钮
class _ReviewButtons extends StatelessWidget {
  final void Function(ReviewResult)? onReview;

  const _ReviewButtons({this.onReview});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FeedbackBtn(
          label: '😰 太难',
          color: AppColors.btnHard,
          onTap: () => onReview?.call(ReviewResult.hard),
        ),
        const SizedBox(width: 8),
        _FeedbackBtn(
          label: '🤔 模糊',
          color: AppColors.btnGood,
          flex: 2,
          onTap: () => onReview?.call(ReviewResult.good),
        ),
        const SizedBox(width: 8),
        _FeedbackBtn(
          label: '⚡ 太简单',
          color: AppColors.btnEasy,
          onTap: () => onReview?.call(ReviewResult.easy),
        ),
      ],
    );
  }
}

class _FeedbackBtn extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback? onTap;
  final int flex;

  const _FeedbackBtn({
    required this.label,
    required this.color,
    this.onTap,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.18),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.5), width: 1),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}