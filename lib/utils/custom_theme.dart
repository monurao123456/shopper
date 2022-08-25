import 'package:flutter/material.dart';

class CustomTheme {
  static const Color grey = Color.fromARGB(255, 223, 223, 223);
  static const Color yellow = Color(0xffFFDB47);
  static const cardShadow = [
    BoxShadow(color: grey, blurRadius: 6, spreadRadius: 4, offset: Offset(0, 2))
  ];
  // ignore: constant_identifier_names
  static const buttonShadow = [
    BoxShadow(color: grey, blurRadius: 3, spreadRadius: 4, offset: Offset(1, 3))
  ];
  static  getcardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(35),
      boxShadow: CustomTheme.cardShadow,
    );
  }

  static ThemeData getTheme() {
    Map<String, double> fontSize = {
      "sm": 14,
      "md": 18,
      "lg": 24,
    };
    return ThemeData(
        primaryColor: yellow,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            toolbarHeight: 70,
            titleTextStyle: TextStyle(
              fontSize: fontSize['lg'],
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            )),
        tabBarTheme: const TabBarTheme(
            labelColor: yellow, unselectedLabelColor: Colors.black),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: Colors.black,
              fontSize: fontSize['lg'],
              fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              color: Colors.black,
              fontSize: fontSize['md'],
              fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(
              color: Colors.black,
              fontSize: fontSize['sm'],
              fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              fontSize: fontSize['sm'], fontWeight: FontWeight.normal),
          titleSmall: TextStyle(
              fontSize: fontSize['sm'],
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ));
  }
}
