import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class AppTheme{
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    textTheme: GoogleFonts.robotoTextTheme(),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: EdgeInsets.all(30),
      hintStyle: TextStyle(
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: Colors.white,
          width: 0.5,
        )
      ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 0.5,
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.5,
            )
        )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(fontSize:  20, fontWeight:  FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.all(30),
        hintStyle: TextStyle(
          color: AppColors.grey,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.5,
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 0.5,
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.5,
            )
        )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          elevation: 0,
          textStyle: const TextStyle(fontSize:  20, fontWeight:  FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )
      ),
    ),
  );
}