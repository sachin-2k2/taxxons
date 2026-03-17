import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color brandBlue = Color(0xFF005CAB);       // Primary brand color
  static const Color headerBg = Color(0xFF00629F);        // Header / screen backgrounds

  static const Color loginButtonBg = Color(0xFF004A87);  // Login button
  static const Color surfaceWhite = Colors.white;
  static const Color loginTitleColor = Color(0xFF00629F); // "Login" title text
  static const Color secondaryGrey = Color(0xFF757575);
  static const Color vatPink = Color(0xFFFFEBEE);
  static const Color vatGreen = Color(0xFFE8F5E9);
  static const Color vatCyan = Color(0xFFE0F7FA);
  static const Color purchaseRed = Color(0xFFBC4343);
  static const Color salesGreen = Color(0xFF55B54D);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.brandBlue,
        primary: AppColors.brandBlue,
        surface: AppColors.surfaceWhite,
      ),
      textTheme: GoogleFonts.interTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.brandBlue,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.brandBlue, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brandBlue,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
