import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

// TTS 播放状态
enum TtsState { stopped, playing }

class TtsService {
  TtsService._();
  static final TtsService instance = TtsService._();

  final FlutterTts _tts = FlutterTts();
  TtsState state = TtsState.stopped;

  // ─────────────────────────────────────────
  //  初始化（在 main.dart 中 await 调用）
  // ─────────────────────────────────────────
  Future<void> init() async {
    // 设置俄语语言
    await _tts.setLanguage('ru-RU');

    // 语速：0.0 ~ 1.0，0.45 接近正常母语速度
    await _tts.setSpeechRate(0.45);

    // 音量
    await _tts.setVolume(1.0);

    // 音调：1.0 为正常
    await _tts.setPitch(1.0);

    // iOS 专属：使用高质量的 Siri 语音引擎
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      await _tts.setSharedInstance(true);
      await _tts.setIosAudioCategory(
        IosTextToSpeechAudioCategory.playback,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
        ],
        IosTextToSpeechAudioMode.defaultMode,
      );
    }

    // 播放完毕回调
    _tts.setCompletionHandler(() {
      state = TtsState.stopped;
    });

    // 错误回调
    _tts.setErrorHandler((msg) {
      state = TtsState.stopped;
      debugPrint('TTS error: $msg');
    });
  }

  // ─────────────────────────────────────────
  //  核心：朗读俄语文本
  //  ⚠️ 传入前必须过滤重音符，否则 iOS TTS
  //     会把 U+0301 读成奇怪的停顿或杂音
  // ─────────────────────────────────────────
  Future<void> speak(String textWithAccents) async {
    // 过滤 Unicode 组合重音符 U+0301
    final clean = textWithAccents.replaceAll('\u0301', '');

    if (clean.trim().isEmpty) return;

    // 如果正在播放则先停止
    if (state == TtsState.playing) {
      await stop();
    }

    state = TtsState.playing;
    await _tts.speak(clean);
  }

  // ─────────────────────────────────────────
  //  直接传入已过滤好的纯净文本（wordForTts）
  // ─────────────────────────────────────────
  Future<void> speakClean(String cleanText) async {
    if (cleanText.trim().isEmpty) return;

    if (state == TtsState.playing) {
      await stop();
    }

    state = TtsState.playing;
    await _tts.speak(cleanText);
  }

  Future<void> stop() async {
    await _tts.stop();
    state = TtsState.stopped;
  }

  // ─────────────────────────────────────────
  //  检查是否支持俄语（调试用）
  // ─────────────────────────────────────────
  Future<bool> isRussianAvailable() async {
    final languages = await _tts.getLanguages;
    final list = (languages as List).map((e) => e.toString()).toList();
    debugPrint('TTS available languages: $list');
    return list.any((l) => l.startsWith('ru'));
  }
}