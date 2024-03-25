import 'package:flutter/material.dart';

class CDLTextFormField extends StatelessWidget {
  const CDLTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.width,
  });
  final double? width;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          //TODO: Verificar estilo e tema principal
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
