import 'package:ai_app/style/app_color.dart';
import 'package:ai_app/style/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //-------------------------------DarkTheme-------------------------------//
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColor.primaryDarkColor,
      // fontFamily: 'DMSans',
      primaryColor: AppColor.primaryDarkColor,
      highlightColor: AppColor.textFieldDarkColor,
      canvasColor: AppColor.whiteColor,
      iconTheme: const IconThemeData(
        color: AppColor.iconDarkColor,
      ),
      textTheme: const TextTheme(
        bodyLarge: AppTextStyle.txt16,
        bodyMedium: AppTextStyle.txt14,
        bodySmall: AppTextStyle.txt13,
        headlineLarge: AppTextStyle.txt17,
        headlineMedium: AppTextStyle.txt17,
        headlineSmall: AppTextStyle.txt17,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        titleTextStyle: AppTextStyle.txt17,
        backgroundColor: AppColor.mainColor,
      ),
    );
  }

  //-------------------------------LightTheme-------------------------------//
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.primaryLightColor,
      primaryColor: AppColor.primaryLightColor,
      highlightColor: AppColor.textFieldLightColor,
      iconTheme: const IconThemeData(
        color: AppColor.iconLightColor,
      ),
      canvasColor: AppColor.darkColor,
      textTheme: const TextTheme(
        bodyLarge: AppTextStyle.txt16,
        bodyMedium: AppTextStyle.txt14,
        bodySmall: AppTextStyle.txt13,
        headlineLarge: AppTextStyle.txt17,
        headlineMedium: AppTextStyle.txt17,
        headlineSmall: AppTextStyle.txt17,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        titleTextStyle: AppTextStyle.txt17,
        backgroundColor: AppColor.mainColor,
      ),
    );
  }
}
