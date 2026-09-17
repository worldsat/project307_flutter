import 'package:flutter/material.dart';

class AppColors {
  // Primary Rose Crimson (from DESIGN.md & Color.kt)
  static const Color primary = Color(0xFFB80035);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFFE11D48);
  static const Color onPrimaryContainer = Color(0xFFFFFAF9);
  static const Color primaryFixed = Color(0xFFFFDADA);
  static const Color onPrimaryFixed = Color(0xFF40000C);

  // Secondary Amber / Warm Bronze
  static const Color secondary = Color(0xFF9D4300);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFFD761A);
  static const Color onSecondaryContainer = Color(0xFF5C2400);
  static const Color secondaryFixed = Color(0xFFFFDBCA);
  static const Color onSecondaryFixed = Color(0xFF341100);

  // Tertiary
  static const Color tertiary = Color(0xFFB70438);
  static const Color tertiaryContainer = Color(0xFFDB2B4E);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryContainer = Color(0xFFFFFAF9);

  // Surface & Neutral Shades (Matching Jetpack Compose Color.kt exactly)
  static const Color surface = Color(0xFFFAF8FF);
  static const Color surfaceBright = Color(0xFFFFFFFF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF2F3FF);
  static const Color surfaceContainer = Color(0xFFEAEDFF);
  static const Color surfaceContainerHigh = Color(0xFFE2E7FF);
  static const Color surfaceContainerHighest = Color(0xFFDAE2FD);

  // Text & Content Shades
  static const Color onSurface = Color(0xFF131B2E);
  static const Color onSurfaceVariant = Color(0xFF5C3F40);
  static const Color outline = Color(0xFF906F70);
  static const Color outlineVariant = Color(0xFFE5BDBE);

  // Semantic Colors
  static const Color successGreen = Color(0xFF16A34A);
  static const Color warningAmber = Color(0xFFD97706);
  static const Color errorRed = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color onErrorContainer = Color(0xFF93000A);
  static const Color inverseSurface = Color(0xFF283044);
  static const Color inverseOnSurface = Color(0xFFEEF0FF);
}
