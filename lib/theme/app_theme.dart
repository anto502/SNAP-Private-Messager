import 'package:flutter/material.dart';

class SnapColors {
  static const background = Color(0xFF0D1016);
  static const surface = Color(0xFF171B23);
  static const elevated = Color(0xFF202631);
  static const purple = Color(0xFF7B3FF2);
  static const text = Color(0xFFF4F5F7);
  static const muted = Color(0xFF9EA5B1);
  static const line = Color(0xFF303743);
  static const success = Color(0xFF5BE49B);
}

class SnapTheme {
  static ThemeData get dark {
    final scheme = ColorScheme.fromSeed(
      seedColor: SnapColors.purple,
      brightness: Brightness.dark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme.copyWith(
        primary: SnapColors.purple,
        surface: SnapColors.surface,
      ),
      scaffoldBackgroundColor: SnapColors.background,
      fontFamily: 'sans',
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: SnapColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: SnapColors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: SnapColors.line),
        ),
      ),
    );
  }
}
