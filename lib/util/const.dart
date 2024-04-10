// lib/util/const.dart

import 'package:flutter/material.dart';

class Constants {
  static String appName = "Foody Bite";

  //Colors for theme
  static Color lightPrimary = const Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = const Color(0xff5563ff);
  static Color darkAccent = const Color(0xff5563ff);
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color? ratingBG = Colors.yellow[600];

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      background: lightBG,
      primary: lightPrimary,
      onPrimary: Colors.black,
      secondary: lightAccent,
      onSecondary: Colors.white,
    ),
    hintColor: lightAccent,
    cardColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: darkBG,
        size: 24.0,
      ),
      titleTextStyle: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: darkBG,
      primary: darkPrimary,
      onPrimary: Colors.white,
      secondary: darkAccent,
      onSecondary: Colors.black,
    ),
    hintColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cardColor: darkAccent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: lightBG,
        size: 24.0,
      ),
      titleTextStyle: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}