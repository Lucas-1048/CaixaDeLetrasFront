import 'package:flutter/material.dart';

class CDLTextFormField extends StatelessWidget {
  const CDLTextFormField({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.width,
  });
  final double? width;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        obscureText: obscureText,
        style: TextStyle(
          color: Colors.white,
        ),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
