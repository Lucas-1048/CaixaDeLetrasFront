import 'package:caixa_de_letras/routes/routes_name.dart';
import 'package:caixa_de_letras/screens/login/login_builder.dart';
import 'package:caixa_de_letras/screens/signUp/sign_up_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? routes(RouteSettings settings) {
  if (settings.name == RoutesNames.login.name) {
    return MaterialPageRoute(builder: (_) => const LoginBuilder());
  }
  if (settings.name == RoutesNames.signUp.name) {
    return MaterialPageRoute(builder: (_) => const SignUpScreen());
  }

  return null;
}

Widget initialHome(BuildContext context) {
  return const LoginBuilder();
}
