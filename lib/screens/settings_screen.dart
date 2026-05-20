import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/ai_service.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _apiKeyCtrl  = TextEditingController();
  final _baseUrlCtrl = TextEditingController();
  final _modelCtrl   = TextEditingController();

  bool _obscureKey = true;   // 遮盖 API Key 显示
  bool _saving     = false;

  @override
  void initState() {
    super.initState();
    _loadSavedConfig();
  }

  @override
  void dispose() {
    _apiKeyCtrl.dispose();
    _baseUrlCtrl.dispose();
    _modelCtrl.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────
  //  加载已保存的配置
  // ─────────────────────────────────────────
  Future<void> _loadSavedConfig() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _apiKeyCtrl.text  = prefs.getString(kPrefApiKey)     ?? '';
      _baseUrlCtrl.text = prefs.getString(kPrefApiBaseUrl) ?? kDefaultBaseUrl;
      _modelCtrl.text   = prefs.getString(kPrefApiModel)   ?? kDefaultModel;
    });
  }

  // ─────────────────────────────────────────
  //  保存配置
  // ─────────────────────────────────────────
  Future<void> _saveConfig() async {
    final apiKey = _apiKeyCtrl.text.trim();
    if (apiKey.isEmpty) {
      _showSnack('请填写 API Key', isError: true);
      return;
    }

    setState(() => _saving = true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(kPrefApiKey,     apiKey);
    await prefs.setString(kPrefApiBaseUrl, _baseUrlCtrl.text.trim());
    await prefs.setString(kPrefApiModel,   _modelCtrl.text.trim());
    setState(() => _saving = false);

    _showSnack('设置已保存 ✅');
  }

  // ─────────────────────────────────────────
  //  重置为默认值
  // ─────────────────────────────────────────
  void _resetDefaults() {
    setState(() {
      _baseUrlCtrl.text = kDefaultBaseUrl;
      _modelCtrl.text   = kDefaultModel;
    });
  }

  void _showSnack(String msg, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: isError ? AppColors.btnHard : AppColors.btnGood,
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          '设置',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actions: [
          TextButton(
            onPressed: _saving ? null : _saveConfig,
            child: _saving
                ? const SizedBox(
                    width: 18, height: 18,
                    child: CircularProgressIndicator(
                      color: AppColors.accent, strokeWidth: 2),
                  )
                : const Text(
                    '保存',
                    style: TextStyle(
                      color:      AppColors.accent,
                      fontSize:   16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── AI 服务配置 ──
            _SectionHeader(title: '🤖 AI 服务配置'),
            const SizedBox(height: 12),

            // API Key 输入
            _buildLabel('API Key', required: true),
            const SizedBox(height: 6),
            TextField(
              controller:  _apiKeyCtrl,
              obscureText: _obscureKey,
              style: const TextStyle(
                color:    AppColors.textPrimary,
                fontSize: 15,
                fontFamily: 'monospace',
              ),
              decoration: _inputDecoration(
                hint: '输入你的 DeepSeek / OpenAI API Key',
                suffix: IconButton(
                  icon: Icon(
                    _obscureKey
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textMuted,
                    size: 20,
                  ),
                  onPressed: () =>
                      setState(() => _obscureKey = !_obscureKey),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // API Key 获取提示
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:        AppColors.accent.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: AppColors.accent.withOpacity(0.2)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💡 如何获取 API Key',
                    style: TextStyle(
                      color:      AppColors.accent,
                      fontSize:   13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'DeepSeek：访问 platform.deepseek.com → API Keys\n'
                    'OpenAI：访问 platform.openai.com → API Keys',
                    style: TextStyle(
                      color:    AppColors.textMuted,
                      fontSize: 12,
                      height:   1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Base URL
            _buildLabel('Base URL'),
            const SizedBox(height: 6),
            TextField(
              controller: _baseUrlCtrl,
              style: const TextStyle(
                color:    AppColors.textPrimary,
                fontSize: 15,
              ),
              decoration: _inputDecoration(
                hint: kDefaultBaseUrl,
              ),
            ),

            const SizedBox(height: 16),

            // Model
            _buildLabel('模型名称'),
            const SizedBox(height: 6),
            TextField(
              controller: _modelCtrl,
              style: const TextStyle(
                color:    AppColors.textPrimary,
                fontSize: 15,
              ),
              decoration: _inputDecoration(
                hint: kDefaultModel,
              ),
            ),

            const SizedBox(height: 8),

            // 快捷选择模型
            Wrap(
              spacing: 8,
              children: [
                'deepseek-chat',
                'gpt-4o-mini',
                'gpt-4o',
              ].map((m) => ActionChip(
                label: Text(
                  m,
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 12),
                ),
                backgroundColor: AppColors.cardFront,
                side: BorderSide(
                    color: Colors.white.withOpacity(0.1)),
                onPressed: () =>
                    setState(() => _modelCtrl.text = m),
              )).toList(),
            ),

            const SizedBox(height: 12),

            // 重置按钮
            TextButton.icon(
              onPressed: _resetDefaults,
              icon: const Icon(Icons.restart_alt,
                  color: AppColors.textMuted, size: 16),
              label: const Text(
                '恢复默认 URL 和模型',
                style: TextStyle(
                    color: AppColors.textMuted, fontSize: 13),
              ),
            ),

            const SizedBox(height: 32),

            // ── 关于 ──
            _SectionHeader(title: 'ℹ️ 关于'),
            const SizedBox(height: 12),
            _AboutCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text, {bool required = false}) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color:      AppColors.textMuted,
            fontSize:   13,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (required)
          const Text(
            ' *',
            style: TextStyle(color: AppColors.btnHard, fontSize: 13),
          ),
      ],
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText:    hint,
      hintStyle:   const TextStyle(color: AppColors.textMuted, fontSize: 14),
      filled:      true,
      fillColor:   AppColors.cardFront,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:   BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
            const BorderSide(color: AppColors.accent, width: 1.5),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      suffixIcon: suffix,
    );
  }
}

// ─────────────────────────────────────────────
//  子组件
// ─────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color:      AppColors.textPrimary,
        fontSize:   16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:        AppColors.cardFront,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Column(
        children: [
          _AboutRow(label: '应用名称', value: 'Русский · 俄语闪卡'),
          _AboutRow(label: '版本',     value: '1.0.0'),
          _AboutRow(label: '数据库',   value: 'Isar（本地离线）'),
          _AboutRow(label: 'AI 引擎',  value: 'DeepSeek / OpenAI'),
          _AboutRow(label: '记忆算法', value: '艾宾浩斯间隔重复'),
        ],
      ),
    );
  }
}

class _AboutRow extends StatelessWidget {
  final String label;
  final String value;
  const _AboutRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  color: AppColors.textMuted, fontSize: 14)),
          Text(value,
              style: const TextStyle(
                  color: AppColors.textPrimary, fontSize: 14)),
        ],
      ),
    );
  }
}