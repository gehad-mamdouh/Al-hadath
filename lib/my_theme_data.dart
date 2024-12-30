import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
class MyThemeData{
  static final ThemeData lightTheme =ThemeData(
      primaryColor: AppColors.primarylightColor,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primarylightColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          )
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor
        ),
        titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor
        ),
        titleSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor
        ),
      )
  );
}