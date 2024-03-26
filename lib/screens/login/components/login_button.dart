import 'package:caixa_de_letras/bloc/screens/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: context.read<LoginBloc>(),
        builder: (context, state) {
          return ElevatedButton(
            onPressed: state is LoginLoading ? () {} : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: SizedBox(
              width: 100,
              height: 40,
              child: Center(
                  child: Visibility(
                visible: state is! LoginLoading,
                replacement: const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                child: const Text(
                  'Entrar', // TODO: Substituir texto por tradução
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              )),
            ),
          );
        });
  }
}
