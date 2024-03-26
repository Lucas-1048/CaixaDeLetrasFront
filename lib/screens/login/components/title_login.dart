import 'package:flutter/material.dart';

class TitleLogin extends StatelessWidget {
  const TitleLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100, bottom: 50),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Image.asset(
            'lib/assets/images/icons8-letterboxd-96.png',
            width: 100,
          ),
          const Text(
            'Caixa de Letras',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
