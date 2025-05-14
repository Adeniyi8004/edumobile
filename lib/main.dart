import 'package:edumobile/screens/practice_options_screen.dart';
import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'theme/dimens.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduMobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Outfit',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.lightGreen,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: AppColors.lightGreen,

        // Updated TextTheme keys for Material 3:
        textTheme: TextTheme(
          // Large headings
          headlineLarge: TextStyle(
            fontSize: Dimens.heading1,
            fontWeight: FontWeight.bold,
            color: AppColors.textOnLight,
          ),
          // Secondary headings
          headlineMedium: TextStyle(
            fontSize: Dimens.heading2,
            fontWeight: FontWeight.bold,
            color: AppColors.textOnLight,
          ),
          // Standard body text
          bodyMedium: TextStyle(
            fontSize: Dimens.bodyText,
            color: AppColors.textOnLight,
          ),
          // Small captions
          bodySmall: TextStyle(
            fontSize: Dimens.caption,
            color: AppColors.secondaryText,
          ),
        ),

        // Global TextButton style
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.lightGreen,
            textStyle: TextStyle(fontSize: Dimens.bodyText),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
