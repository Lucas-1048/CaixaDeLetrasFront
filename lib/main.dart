import 'package:caixa_de_letras/screens/login/login_builder.dart';
import 'package:caixa_de_letras/themes/cdl_theme.dart';
import 'package:caixa_de_letras/utils/hive/tokens/hive_tokens.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await HiveTokens.initHiveTokens();

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
      home: const LoginBuilder(),
    );
  }
}
