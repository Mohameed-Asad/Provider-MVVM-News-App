import 'package:flutter/material.dart';

class AppThemeManager {
  static const Color primaryColor = Color(0xFF39A552);

  static ThemeData appTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: "Exo",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35))),
        iconTheme: IconThemeData(color: Colors.white, size: 35),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "Exo",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: "Exo",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontFamily: "Exo",
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ));
}
