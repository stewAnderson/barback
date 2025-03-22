import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 44.0,
        fontFamily: GoogleFonts.patuaOne().fontFamily,
      ),
      headlineMedium: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    ));
