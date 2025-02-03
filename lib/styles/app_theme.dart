import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iss_mir_egal/styles/app_colors.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
      textTheme: GoogleFonts.urbanistTextTheme().copyWith(),
      primaryColor: AppColors.primaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.grey,
        selectedItemColor: AppColors.white,
      ));
  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.urbanistTextTheme().copyWith(),
      );
}
