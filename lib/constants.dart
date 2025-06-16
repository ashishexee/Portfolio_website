import 'package:flutter/material.dart';

class AppColors {
  // Primary Cyan Colors
  static const Color primaryCyan = Color(0xFF00BCD4);
  static const Color darkCyan = Color(0xFF0097A7);
  static const Color lightCyan = Color(0xFF4DD0E1);
  static const Color accentCyan = Color(0xFF26C6DA);
  
  // Background Colors
  static const Color darkBackground = Color(0xFF0D1117);
  static const Color cardBackground = Color(0xFF161B22);
  static const Color surfaceColor = Color(0xFF21262D);
  
  // Text Colors
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xFFB1B3B8);
  static const Color mutedText = Color(0xFF8B949E);
  
  // Accent Colors
  static const Color highlightCyan = Color(0xFF64FFDA);
  static const Color gradientStart = Color(0xFF00BCD4);
  static const Color gradientEnd = Color(0xFF004D5A);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE57373);
  
  // Border Colors
  static const Color borderColor = Color(0xFF30363D);
  static const Color focusBorder = Color(0xFF00BCD4);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [cardBackground, surfaceColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: createMaterialColor(AppColors.primaryCyan),
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardColor: AppColors.cardBackground,
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: AppColors.primaryText, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: AppColors.primaryText, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: AppColors.primaryText),
        bodyMedium: TextStyle(color: AppColors.secondaryText),
        bodySmall: TextStyle(color: AppColors.mutedText),
      ),
      iconTheme: const IconThemeData(color: AppColors.primaryCyan),
    );
  }
  
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}