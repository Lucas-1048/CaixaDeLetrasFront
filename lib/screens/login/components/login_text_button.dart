import 'package:flutter/material.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({super.key, required this.labelText, this.onPressed});
  final String labelText;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
