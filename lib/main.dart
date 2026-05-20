import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/word_card.dart';
import 'services/db_service.dart';
import 'services/tts_service.dart';
import 'theme/app_theme.dart';
import 'screens/study_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化数据库
  await DbService.instance.init();

  // 初始化 TTS
  await TtsService.instance.init();

  // 首次启动注入测试数据
  await _seedIfEmpty();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const RussianFlashcardApp());
}

Future<void> _seedIfEmpty() async {
  final db = DbService.instance;
  final all = await db.getAllWords();
  if (all.isNotEmpty) return;

  await db.addWords([
    WordCard.create(
      word:         'приве́т',
      phonetic:     '[prʲɪˈvʲet]',
      meaning:      '你好（非正式问候）',
      partOfSpeech: 'interj.',
      examplesRu:   ['Приве́т, как дела́?', 'Приве́т! Рад тебя́ ви́деть.'],
      examplesZh:   ['你好，最近怎么样？', '嗨！很高兴见到你。'],
      category:     WordCategory.daily,
    ),
    WordCard.create(
      word:         'спаси́бо',
      phonetic:     '[spɐˈsʲibə]',
      meaning:      '谢谢',
      partOfSpeech: 'interj.',
      examplesRu:   ['Большо́е спаси́бо за по́мощь!', 'Спаси́бо, всё хорошо́.'],
      examplesZh:   ['非常感谢你的帮助！', '谢谢，一切都好。'],
      category:     WordCategory.daily,
    ),
  ]);
}

class RussianFlashcardApp extends StatelessWidget {
  const RussianFlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Русский · 俄语闪卡',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const StudyScreen(),
    );
  }
}