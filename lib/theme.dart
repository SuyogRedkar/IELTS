import 'package:flutter/material.dart' hide Colors;
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kBase,
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return const TextTheme(
      headline1: TextStyle(
        color: kAccent,
        fontFamily: 'Outfit',
        fontSize: 24,
        letterSpacing: 0.64,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ),
      headline2: TextStyle(
        color: kAccent,
        fontFamily: 'Outfit',
        fontSize: 16,
        letterSpacing: 0.32,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        color: kAccent,
        fontFamily: 'Outfit',
        fontSize: 12,
        letterSpacing: 0.32,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        color: kAccent,
        fontFamily: 'Outfit',
        fontSize: 10,
        letterSpacing: 0.32,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      ),
      headline5: TextStyle(
        color: kAccent,
        fontFamily: 'Outfit',
        fontSize: 14,
        letterSpacing: 0.32,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ));
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: kWarning,
    iconTheme: IconThemeData(color: kBase),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: kSecondary),
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 9, vertical: 13.5),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
