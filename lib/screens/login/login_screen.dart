import 'package:caixa_de_letras/bloc/screens/login/login_bloc.dart';
import 'package:caixa_de_letras/components/cdl_text_form_field.dart';
import 'package:caixa_de_letras/models/User/login_user.dart';
import 'package:caixa_de_letras/screens/login/components/login_button.dart';
import 'package:caixa_de_letras/screens/login/components/login_text_button.dart';
import 'package:caixa_de_letras/screens/login/components/title_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool loginFailured = false;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKeyLogin = GlobalKey<FormState>();
    return Form(
      key: formKeyLogin,
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          bloc: context.read<LoginBloc>(),
          listener: (context, state) {
            if (state is LoginSuccess) {
              debugPrint('Login realizado');
              loginFailured = false;
              formKeyLogin.currentState!.validate();
              //TODO: Navegar para a próxima tela
            }

            if (state is LoginFailured) {
              loginFailured = true;
              formKeyLogin.currentState!.validate();
            }
          },
          child: Container(
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.shade900,
                  Colors.grey.shade800,
                  Colors.grey.shade700,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  SizedBox(
                    height: 700,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TitleLogin(),
                        SizedBox(
                          height: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CDLTextFormField(
                                labelText: 'E-mail',
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                width: 290,
                                validator: (emailText) {
                                  if (emailText == null || emailText.isEmpty) {
                                    return 'Campo obrigatório';
                                  }

                                  if (loginFailured) {
                                    return 'E-mail ou senha inválidos';
                                  }

                                  return null;
                                },
                              ),
                              CDLTextFormField(
                                labelText: 'Senha',
                                controller: passwordController,
                                width: 290,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (passwordText) {
                                  if (passwordText == null ||
                                      passwordText.isEmpty) {
                                    return 'Campo obrigatório';
                                  }

                                  if (loginFailured) {
                                    return 'E-mail ou senha inválidos';
                                  }

                                  return null;
                                },
                              ),
                              LoginButton(
                                onPressed: () {
                                  if (formKeyLogin.currentState!.validate() ||
                                      loginFailured) {
                                    LoginUser loginUser = LoginUser(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );

                                    context.read<LoginBloc>().add(
                                        LoginFetchEvent(loginUser: loginUser));
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    LoginTextButton(
                                      labelText: 'Esqueci senha',
                                    ),
                                    LoginTextButton(
                                      labelText: 'Cadastre-se',
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
