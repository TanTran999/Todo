import 'package:flutter/material.dart';

Color kTextColor = Color(0xFF333333);
const Color kMainColor = Color(0xFF454fe3);
const Color ksubColor1 = Color(0xFFff3d5c);
const Color ksubColor2 = Color(0xFF8080ff);

class DarkThemeCustom {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
      scaffoldBackgroundColor: Color(0xFF555555),
    );
  }
}