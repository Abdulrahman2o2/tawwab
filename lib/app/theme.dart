import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

/// Application theme built from the Tawwab brand identity.
class TawwabTheme {
  TawwabTheme._();

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: TawwabColors.primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: TawwabColors.primary,
      onPrimary: Colors.white,
      secondary: TawwabColors.accent,
      onSecondary: TawwabColors.ink,
      surface: TawwabColors.surface,
      onSurface: TawwabColors.ink,
      error: TawwabColors.error,
    );

    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: TawwabColors.surface,
      textTheme: GoogleFonts.plusJakartaSansTextTheme(base.textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: TawwabColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: TawwabColors.primary.withValues(alpha: 0.08)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: TawwabColors.accentSoft,
        labelTextStyle: WidgetStatePropertyAll(
          GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: TawwabColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
    );
  }

  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      seedColor: TawwabColors.primary,
      brightness: Brightness.dark,
    ).copyWith(
      primary: TawwabColors.primaryLight,
      onPrimary: Colors.white,
      secondary: TawwabColors.accent,
      onSecondary: TawwabColors.darkBase,
      surface: TawwabColors.darkSurface,
      onSurface: TawwabColors.darkInk,
    );

    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: TawwabColors.darkBase,
      textTheme: GoogleFonts.plusJakartaSansTextTheme(base.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: TawwabColors.darkSurface,
        foregroundColor: TawwabColors.darkInk,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: TawwabColors.darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: TawwabColors.accent.withValues(alpha: 0.18)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: TawwabColors.darkSurface,
        indicatorColor: TawwabColors.primaryDeep,
        labelTextStyle: WidgetStatePropertyAll(
          GoogleFonts.plusJakartaSans(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
