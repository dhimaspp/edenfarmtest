import 'package:flutter/material.dart';

// Colos that use in our app
const kSecondaryColor = Color(0xFF307B52);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9E9E9E);
const kFillColor = Color(0xFFEAF1ED);
const kMaincolor = Color.fromARGB(255, 0, 0, 0);
// ignore: use_full_hex_values_for_flutter_colors
const kStartColor = Color(0xFF00000080);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(1, 5),
  blurRadius: 4,
  color: Colors.black26,
);

final themePP = ThemeData(
  textTheme: const TextTheme(
      headline3: TextStyle(fontFamily: 'Anodina', fontWeight: FontWeight.w700),
      bodyText1: TextStyle(fontFamily: 'Anodina', fontWeight: FontWeight.w400),
      bodyText2: TextStyle(fontFamily: 'Anodina', fontWeight: FontWeight.w300),
      caption: TextStyle(fontFamily: 'Anodina', fontWeight: FontWeight.w200)),
  splashColor: kFillColor,

  primaryColorDark: const Color(0xFF307B52),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColorLight: const Color(0xFFEAF1ED),
  primaryColor: const Color(0xFF307B52),
  // accentColor: kMaincolor,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  // typography: Ty,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kMaincolor),
);

// class PPtheme with Diagnosticable{
// const TextTheme ({TextStyle dinProBold, TextStyle dinProMedium, TextStyle dinProRegular, TextStyle dinProLight,

// }): assert((dinProBold == null && dinProMedium == null && dinProRegular == null && dinProLight == null)); final TextStyle dinProBold; final TextStyle dinProMedium; final TextStyle dinProRegular; final TextStyle dinProLight; };

const textInputDecoration = InputDecoration(
    focusColor: kMaincolor,
    hoverColor: kSecondaryColor,
    suffixStyle: TextStyle(
        fontFamily: "Roboto",
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: kFillColor),
    labelStyle: TextStyle(
        fontFamily: "Roboto",
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: kFillColor));
