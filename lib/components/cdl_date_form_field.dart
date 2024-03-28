import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CDLDateFormField extends StatelessWidget {
  const CDLDateFormField({
    super.key,
    this.width,
    required this.labelText,
    required this.controller,
    this.validator,
  });
  final double? width;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    return SizedBox(
      width: width,
      child: TextFormField(
        keyboardType: TextInputType.none,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            splashRadius: 22, // TODO: Adicionar a um arquivo de tamanhos
            onPressed: () async {
              selectedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 100),
                lastDate: DateTime.now(),
              );
              if (selectedDate != null) {
                controller.text = DateFormat('dd/MM/yyyy')
                    .format(selectedDate!); // TODO: Data de acordo com o idioma
              }
            },
            icon: const Icon(Icons.calendar_today),
          ),
          labelText: labelText,
        ),
        controller: controller,
        validator: validator,
        readOnly: true,
      ),
    );
  }
}
