import 'package:caixa_de_letras/screens/login/login_screen.dart';
import 'package:caixa_de_letras/themes/cdl_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caixa de Letras',
      theme: cdlTheme,
      home: const LoginScreen(),
    );
  }
}
