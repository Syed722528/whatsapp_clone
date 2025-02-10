import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

ThemeData lightTheme = ThemeData(
  //----------------------Brightness of the screen------------------------//
  brightness: Brightness.light,

  //-----------------------Sacffold background color-----------------------//
  scaffoldBackgroundColor: AppColors.lightBackground,

  primaryColor: AppColors.white,

  //-------------------Default icon color---------------------------//
  iconTheme: IconThemeData(color: AppColors.lightPrimaryColor),

  //-------------------Default Text Theme---------------------------//

  textTheme: TextTheme(
    bodyMedium: TextStyle(
        color: AppColors.lightPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 18),
    bodyLarge: TextStyle(
        color: AppColors.lightPrimaryColor,
        fontSize: 25,
        fontWeight: FontWeight.bold),
    bodySmall: TextStyle(color: AppColors.grey, fontSize: 14),
  ),

  //-------------------Default AppBar Theme---------------------------//

  appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      titleTextStyle:
          TextStyle(color: AppColors.lightPrimaryColor, fontSize: 25)),

  //-------------------Default Bottom navigation bar color---------------------------//

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.lightBackground,
    selectedIconTheme: IconThemeData(color: AppColors.lightPrimaryColor),
    unselectedIconTheme: IconThemeData(color: AppColors.lightPrimaryColor),
    selectedItemColor: AppColors.lightPrimaryColor,
    unselectedItemColor: AppColors.lightPrimaryColor,
    selectedLabelStyle: TextStyle(color: AppColors.lightPrimaryColor),
    unselectedLabelStyle: TextStyle(color: AppColors.lightPrimaryColor),
  ),

  //--------------------Default Floating action button style-------------------------//
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.whatsappLightGreen,
      foregroundColor: AppColors.lightBackground),
);
