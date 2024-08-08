import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class MyTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    colorScheme:
        ColorScheme.fromSeed(seedColor: AppColors.white.withOpacity(0.8)),
    brightness: Brightness.light,
    textTheme: GoogleFonts.manropeTextTheme(),
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
  );
}
