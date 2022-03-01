import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_comics/app/core/themes/app_colors.dart';

class AppStyles {
  static final title = GoogleFonts.kanit(
    color: AppColors.orangeComics,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final nameComic = GoogleFonts.kanit(
    color: AppColors.orangeComics,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    shadows: const [
      BoxShadow(
        color: AppColors.background,
        offset: Offset(1.0, 1.0),
        blurRadius: 5.0,
      ),
    ],
  );

  static final label = GoogleFonts.kanit(
    color: AppColors.greyComics.withOpacity(0.5),
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static final txButton = GoogleFonts.kanit(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
}
