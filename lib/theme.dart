import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.cabin(
        textStyle: TextStyle(
      fontSize: 24,
      color: CustomColors.black,
      fontWeight: FontWeight.bold,
    )),
    headlineMedium: GoogleFonts.cabin(
        textStyle: TextStyle(
      fontSize: 22,
      color: CustomColors.black,
      fontWeight: FontWeight.bold,
    )),
    headlineSmall: GoogleFonts.cabin(
        textStyle: TextStyle(
      fontSize: 18,
      color: CustomColors.black,
      fontWeight: FontWeight.w500,
    )),
    bodyLarge: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 22,
          color: CustomColors.black,
          fontWeight: FontWeight.normal),
    ),
    bodyMedium: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 18,
          color: CustomColors.black,
          fontWeight: FontWeight.normal),
    ),
    bodySmall: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 16,
          color: CustomColors.black,
          fontWeight: FontWeight.normal),
    ),
  ),
);

class CustomColors {
  static Color black = const Color(0xff221813);
  static Color purpleBg = const Color(0xffe2e0f0);
  static Color lightSkin = const Color(0xfff1e7e1);
  static Color lightGreen = const Color(0xffe0eaf0);
  static Color white = const Color(0xfff8fbfb);
}
