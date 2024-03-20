import 'package:caixa_de_letras/components/cdl_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    Container(
                      margin: EdgeInsets.only(top: 100, bottom: 50),
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Image.asset(
                            'lib/assets/images/icons8-letterboxd-96.png',
                            width: 100,
                          ),
                          Text(
                            'Caixa de Letras',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CDLTextFormField(
                            labelText: 'E-mail',
                            keyboardType: TextInputType.emailAddress,
                            width: 290,
                          ),
                          CDLTextFormField(
                            labelText: 'Senha',
                            width: 290,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: 100,
                              height: 40,
                              child: Center(
                                  child: Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade900,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Esqueci a senha',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Cadastre-se',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
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
    );
  }
}
