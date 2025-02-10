import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/app_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

//------------------------------Default background color of Scaffold-------------------//
  scaffoldBackgroundColor: AppColors.darkBackground,
  primaryColor: AppColors.black,
  
  

//------------------------------Default Icon color of -------------------//

  iconTheme: IconThemeData(color: AppColors.darkPrimaryColor),

//------------------------------Default Text Theme of Scaffold-------------------//

  textTheme: TextTheme(
    bodyMedium: TextStyle(color: AppColors.darkPrimaryColor,fontWeight: FontWeight.bold,fontSize: 18),
    bodyLarge: TextStyle(
        color: AppColors.darkPrimaryColor,
        fontSize: 25,
        fontWeight: FontWeight.bold),
    bodySmall: TextStyle(color: AppColors.grey, fontSize: 14),
  
  ),

//------------------------------Default AppBar Theme of Scaffold-------------------//

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkBackground,
    titleTextStyle: TextStyle(color: AppColors.darkPrimaryColor, fontSize: 25),
    foregroundColor: AppColors.darkPrimaryColor,
    centerTitle: false,
  ),

//------------------------------Default Navigation theme of Scaffold-------------------//

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkBackground,
    selectedIconTheme: IconThemeData(color: AppColors.darkPrimaryColor),
    unselectedIconTheme: IconThemeData(color: AppColors.darkPrimaryColor),
    selectedItemColor: AppColors.darkPrimaryColor,
    unselectedItemColor: AppColors.darkPrimaryColor,
    selectedLabelStyle: TextStyle(color: AppColors.darkPrimaryColor),
    unselectedLabelStyle: TextStyle(color: AppColors.darkPrimaryColor),
  ),

//------------------------------Default Floating button color of Scaffold-------------------//

  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.whatsappLightGreen,
      foregroundColor: AppColors.lightPrimaryColor),
);
