import 'package:caixa_de_letras/themes/cdl_text_theme.dart';
import 'package:caixa_de_letras/themes/cdl_theme_color.dart';
import 'package:flutter/material.dart';

ThemeData cdlTheme = ThemeData(
  useMaterial3: true,
  textTheme: CDLTextTheme.textTheme,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: CDLThemeColor.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: const TextStyle(
        color: CDLThemeColor.primaryColor), // TODO: Ajustar temas
    outlineBorder: const BorderSide(color: Colors.black, width: 1.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 1.0,
      ),
    ),
  ),
);
