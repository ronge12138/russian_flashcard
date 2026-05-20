import 'package:flutter/material.dart';
import '../models/word_card.dart';
import '../services/ai_service.dart';
import '../services/db_service.dart';
import '../services/tts_service.dart';
import '../theme/app_theme.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  State<AddWordScreen> createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  final _controller = TextEditingController();
  final _focusNode  = FocusNode();

  AiWordResult? _result;
  bool    _loading  = false;
  String? _error;
  bool    _saved    = false;

  WordCategory _category = WordCategory.custom;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _lookup() async {
    final word = _controller.text.trim();
    if (word.isEmpty) return;

    setState(() {
      _loading = true;
      _error   = null;
      _result  = null;
      _saved   = false;
    });
    _focusNode.unfocus();

    try {
      final result = await AiService.instance.lookupWord(word);
      setState(() => _result = result);
    } on AiException catch (e) {
      setState(() => _error = e.message);
    } catch (e) {
      setState(() => _error = '未知错误：$e');
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _saveWord() async {
    if (_result == null || _saved) return;
    final card = _result!.toWordCard(category: _category);
    await DbService.instance.addWord(card);
    setState(() => _saved = true);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('「${card.word}」已添加到词库 ✅'),
          backgroundColor: AppColors.btnGood,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '添加单词',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 24),
            if (_loading) _buildLoadingCard(),
            if (_error != null) _buildErrorCard(),
            if (_result != null && !_loading) ...[
              _buildResultCard(),
              const SizedBox(height: 20),
              _buildCategorySelector(),
              const SizedBox(height: 20),
              _buildSaveButton(),
            ],
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  //  搜索栏
  // ─────────────────────────────────────────
  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode:  _focusNode,
            enabled:    !_loading,
            style: const TextStyle(
              color:    AppColors.textPrimary,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              hintText:  '输入俄语单词，如 привет',
              hintStyle: const TextStyle(color: AppColors.textMuted),
              filled:    true,
              fillColor: AppColors.cardFront,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide:   BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                    color: AppColors.accent, width: 1.5),
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: AppColors.textMuted,
              ),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 16),
            ),
            onSubmitted: (_) => _lookup(),
            textInputAction: TextInputAction.search,
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: _loading ? null : _lookup,
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color:        AppColors.accent,
              borderRadius: BorderRadius.circular(14),
            ),
            child: _loading
                ? const Padding(
                    padding: EdgeInsets.all(14),
                    child: CircularProgressIndicator(
                      color:       Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : const Icon(
                    Icons.auto_awesome_rounded,
                    color: Colors.white,
                  ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  //  加载中
  // ─────────────────────────────────────────
  Widget _buildLoadingCard() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color:        AppColors.cardFront,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          CircularProgressIndicator(color: AppColors.accent),
          SizedBox(height: 16),
          Text(
            'AI 正在查询中…',
            style: TextStyle(color: AppColors.textMuted, fontSize: 15),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  //  错误提示
  // ─────────────────────────────────────────
  Widget _buildErrorCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:        AppColors.btnHard.withOpacity(0.12),
        borderRadius: BorderRadius.circular(14),
        border:       Border.all(color: AppColors.btnHard.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: AppColors.btnHard),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _error!,
              style: const TextStyle(
                  color: AppColors.btnHard, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  //  AI 结果预览卡片
  // ─────────────────────────────────────────
  Widget _buildResultCard() {
    final r = _result!;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:        AppColors.cardBack,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.accent.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 单词 + 朗读 + 词性
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  r.word,
                  style: const TextStyle(
                    fontSize:   36,
                    fontWeight: FontWeight.bold,
                    color:      AppColors.textPrimary,
                    height:     1.2,
                  ),
                ),
              ),
              // 朗读按钮
              IconButton(
                icon: const Icon(
                  Icons.volume_up_rounded,
                  color: AppColors.accentLight,
                ),
                onPressed: () => TtsService.instance.speak(r.word),
                tooltip: '朗读',
              ),
              // 词性标签
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color:        AppColors.accent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  r.partOfSpeech,
                  style: const TextStyle(
                    color:    AppColors.accent,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // 音标
          Text(
            r.phonetic,
            style: const TextStyle(
              color:     AppColors.accentLight,
              fontSize:  15,
              fontStyle: FontStyle.italic,
            ),
          ),

          // 分隔线
          Container(
            margin: const EdgeInsets.symmetric(vertical: 14),
            height: 1,
            color:  Colors.white.withOpacity(0.08),
          ),

          // 中文释义
          Text(
            r.meaning,
            style: const TextStyle(
              color:      AppColors.textPrimary,
              fontSize:   22,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 16),

          // 例句列表
          ...List.generate(r.examplesRu.length, (i) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:        Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Colors.white.withOpacity(0.08)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    r.examplesRu[i],
                    style: const TextStyle(
                      color:    AppColors.accentLight,
                      fontSize: 14,
                      height:   1.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    r.examplesZh[i],
                    style: const TextStyle(
                      color:    AppColors.textMuted,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  //  分类选择器
  // ─────────────────────────────────────────
  Widget _buildCategorySelector() {
    const categories = {
      WordCategory.custom:   '📁 自定义',
      WordCategory.daily:    '💬 日常用语',
      WordCategory.travel:   '✈️ 旅行',
      WordCategory.business: '💼 商务',
      WordCategory.grammar:  '📖 语法词',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '选择词库分类',
          style: TextStyle(
            color:      AppColors.textMuted,
            fontSize:   13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing:    8,
          runSpacing: 8,
          children: categories.entries.map((entry) {
            final selected = _category == entry.key;
            return GestureDetector(
              onTap: () => setState(() => _category = entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.accent.withOpacity(0.2)
                      : AppColors.cardFront,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: selected
                        ? AppColors.accent
                        : Colors.white.withOpacity(0.1),
                    width: selected ? 1.5 : 1,
                  ),
                ),
                child: Text(
                  entry.value,
                  style: TextStyle(
                    color: selected
                        ? AppColors.accent
                        : AppColors.textMuted,
                    fontSize:   13,
                    fontWeight: selected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  //  保存按钮
  // ─────────────────────────────────────────
  Widget _buildSaveButton() {
    return GestureDetector(
      onTap: _saved ? null : _saveWord,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 54,
        decoration: BoxDecoration(
          color: _saved
              ? AppColors.btnGood.withOpacity(0.3)
              : AppColors.accent,
          borderRadius: BorderRadius.circular(16),
          border: _saved
              ? Border.all(color: AppColors.btnGood, width: 1)
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _saved
                    ? Icons.check_circle_rounded
                    : Icons.add_circle_outline_rounded,
                color: Colors.white,
                size:  20,
              ),
              const SizedBox(width: 8),
              Text(
                _saved ? '已添加到词库' : '添加到词库',
                style: const TextStyle(
                  color:      Colors.white,
                  fontSize:   16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}