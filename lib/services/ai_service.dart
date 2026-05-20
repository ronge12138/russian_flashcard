import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/word_card.dart';

// ─────────────────────────────────────────────
//  SharedPreferences Key 常量
// ─────────────────────────────────────────────
const kPrefApiKey      = 'ai_api_key';
const kPrefApiBaseUrl  = 'ai_base_url';
const kPrefApiModel    = 'ai_model';

const kDefaultBaseUrl  = 'https://api.deepseek.com';
const kDefaultModel    = 'deepseek-chat';

// ─────────────────────────────────────────────
//  AI 返回的结构化数据载体
// ─────────────────────────────────────────────
class AiWordResult {
  final String word;
  final String phonetic;
  final String meaning;
  final String partOfSpeech;
  final List<String> examplesRu;
  final List<String> examplesZh;

  const AiWordResult({
    required this.word,
    required this.phonetic,
    required this.meaning,
    required this.partOfSpeech,
    required this.examplesRu,
    required this.examplesZh,
  });

  factory AiWordResult.fromJson(Map<String, dynamic> j) {
    final exList = j['examples'] as List<dynamic>? ?? [];
    return AiWordResult(
      word:         j['word']         as String? ?? '',
      phonetic:     j['phonetic']     as String? ?? '',
      meaning:      j['meaning']      as String? ?? '',
      partOfSpeech: j['partOfSpeech'] as String? ?? '',
      examplesRu:   exList.map((e) => e['ru'] as String? ?? '').toList(),
      examplesZh:   exList.map((e) => e['zh'] as String? ?? '').toList(),
    );
  }

  WordCard toWordCard({WordCategory category = WordCategory.custom}) {
    return WordCard.create(
      word:         word,
      phonetic:     phonetic,
      meaning:      meaning,
      partOfSpeech: partOfSpeech,
      examplesRu:   examplesRu,
      examplesZh:   examplesZh,
      category:     category,
    );
  }
}

// ─────────────────────────────────────────────
//  AiService 单例
// ─────────────────────────────────────────────
class AiService {
  AiService._();
  static final AiService instance = AiService._();

  // ─────────────────────────────────────────
  //  从 SharedPreferences 读取配置
  // ─────────────────────────────────────────
  Future<Map<String, String>> _loadConfig() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'apiKey':  prefs.getString(kPrefApiKey)     ?? '',
      'baseUrl': prefs.getString(kPrefApiBaseUrl) ?? kDefaultBaseUrl,
      'model':   prefs.getString(kPrefApiModel)   ?? kDefaultModel,
    };
  }

  // ─────────────────────────────────────────
  //  System Prompt
  // ─────────────────────────────────────────
  static const _systemPrompt = '''
你是一个专业的俄语词典助手。用户给你一个俄语单词，你必须严格返回如下 JSON，不得包含任何多余文字或 markdown 代码块：
{
  "word": "带Unicode重音符U+0301的俄语原型，重音符紧跟在重读元音之后",
  "phonetic": "国际音标，用方括号包裹",
  "partOfSpeech": "词性缩写，如 n. / v. / adj. / adv. / interj.",
  "meaning": "简洁精准的中文释义，不超过20字",
  "examples": [
    {"ru": "第一个俄语例句，带重音符", "zh": "对应中文翻译"},
    {"ru": "第二个俄语例句，带重音符", "zh": "对应中文翻译"}
  ]
}
重音规则：在重读元音的码点之后插入 U+0301，例如 а́=а\u0301，е́=е\u0301。
''';

  // ─────────────────────────────────────────
  //  核心查词方法
  // ─────────────────────────────────────────
  Future<AiWordResult> lookupWord(String rawWord) async {
    final config = await _loadConfig();
    final apiKey  = config['apiKey']!;
    final baseUrl = config['baseUrl']!;
    final model   = config['model']!;

    if (apiKey.isEmpty) {
      throw AiException('请先在设置页填写 API Key');
    }

    final dio = Dio(BaseOptions(
      baseUrl:        baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type':  'application/json',
        'Authorization': 'Bearer $apiKey',
      },
    ));

    try {
      final resp = await dio.post(
        '/v1/chat/completions',
        data: {
          'model':       model,
          'temperature': 0.1,
          'max_tokens':  600,
          'messages': [
            {'role': 'system', 'content': _systemPrompt},
            {'role': 'user',   'content': '请查询俄语单词：${rawWord.trim()}'},
          ],
        },
      );

      final raw = resp.data['choices'][0]['message']['content'] as String;
      return _parseResponse(raw);

    } on DioException catch (e) {
      throw AiException(_dioErrorMessage(e));
    } catch (e) {
      throw AiException('解析失败：$e');
    }
  }

  // ─────────────────────────────────────────
  //  JSON 解析（容错 markdown 代码块）
  // ─────────────────────────────────────────
  AiWordResult _parseResponse(String raw) {
    String clean = raw.trim();
    if (clean.startsWith('```')) {
      clean = clean
          .replaceFirst(RegExp(r'^```[a-z]*\n?'), '')
          .replaceFirst(RegExp(r'```\s*$'), '')
          .trim();
    }
    final Map<String, dynamic> json = jsonDecode(clean);
    final result = AiWordResult.fromJson(json);
    if (result.word.isEmpty)    throw AiException('AI 未返回单词原型');
    if (result.meaning.isEmpty) throw AiException('AI 未返回中文释义');
    return result;
  }

  String _dioErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return '网络超时，请检查连接后重试';
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        if (code == 401) return 'API Key 无效，请在设置中重新填写';
        if (code == 429) return '请求过于频繁，请稍后再试';
        return '服务器错误（$code）';
      case DioExceptionType.connectionError:
        return '无法连接服务器，请检查网络';
      default:
        return '请求失败：${e.message}';
    }
  }
}

class AiException implements Exception {
  final String message;
  const AiException(this.message);
  @override
  String toString() => message;
}