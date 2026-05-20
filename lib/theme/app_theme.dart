import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF0F0F1A);
  static const cardFront   = Color(0xFF1C1C2E);
  static const cardBack    = Color(0xFF162032);
  static const accent      = Color(0xFF5C85D6);
  static const accentLight = Color(0xFF90CAF9);
  static const textPrimary = Colors.white;
  static const textMuted   = Color(0xFF8A8AA0);

  // 三个反馈按钮颜色
  static const btnHard  = Color(0xFFE05C5C); // 太难 — 红
  static const btnGood  = Color(0xFF4CAF8A); // 模糊 — 绿
  static const btnEasy  = Color(0xFF5C85D6); // 太简单 — 蓝
}

class AppTheme {
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accent,
      surface: AppColors.cardFront,
    ),
    fontFamily: 'Roboto',
    useMaterial3: true,
  );
}