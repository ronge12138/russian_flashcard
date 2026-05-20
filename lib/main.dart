import 'package:flutter/material.dart';
import 'models/word_card.dart';
import 'services/db_service.dart';
import 'services/tts_service.dart';
import 'theme/app_theme.dart';
import 'screens/study_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbService.instance.init();
  await TtsService.instance.init();
  await _seedIfEmpty();
  runApp(const RussianFlashcardApp());
}

Future<void> _seedIfEmpty() async {
  final db = DbService.instance;
  final all = await db.getAllWords();
  if (all.isNotEmpty) return;

  await db.addWords([
    WordCard.create(
      word:         'приве\u0301т',
      phonetic:     '[prʲɪˈvʲet]',
      meaning:      '你好（非正式问候）',
      partOfSpeech: 'interj.',
      examplesRu:   ['Приве\u0301т, как дела\u0301?', 'Приве\u0301т! Рад тебя\u0301 ви\u0301деть.'],
      examplesZh:   ['你好，最近怎么样？', '嗨！很高兴见到你。'],
      category:     WordCategory.daily,
    ),
    WordCard.create(
      word:         'спаси\u0301бо',
      phonetic:     '[spɐˈsʲibə]',
      meaning:      '谢谢',
      partOfSpeech: 'interj.',
      examplesRu:   ['Большо\u0301е спаси\u0301бо за по\u0301мощь!', 'Спаси\u0301бо, всё хорошо\u0301.'],
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
