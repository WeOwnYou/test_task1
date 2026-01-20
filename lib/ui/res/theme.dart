import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFF4F6F8),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF246BFD),
    surface: const Color(0xFFF4F6F8),
  ),
  textTheme: const TextTheme(
    // Заголовки онбординга
    headlineMedium: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),

    // Основной текст
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.black54,
      height: 1.4,
    ),

    // Текст кнопок
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 52),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
