import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme=ThemeData(

    cardTheme: CardTheme(
        color:HexColor('333739'),
        shadowColor:Colors.grey.shade700

    ),
    scaffoldBackgroundColor: HexColor('333739'),
    primarySwatch: Colors.red,
    appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: HexColor('333739')),
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 20),
        backgroundColor: HexColor('333739')),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      backgroundColor: HexColor('333739'),
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white)));
ThemeData lightTheme= ThemeData(
    cardTheme: CardTheme(
        color: Colors.white, shadowColor: Colors.grey.shade400),
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
      elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 20),
        backgroundColor: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black)));