import 'package:flutter/material.dart';

class CDLDropDownField extends StatefulWidget {
  const CDLDropDownField({
    super.key,
    required this.items,
    required this.labelText,
    this.width,
    required this.controller,
  });
  final List<String> items;
  final String labelText;
  final double? width;
  final TextEditingController controller;

  @override
  State<CDLDropDownField> createState() => _CDLDropDownFieldState();
}

class _CDLDropDownFieldState extends State<CDLDropDownField> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: DropdownButtonFormField(
        menuMaxHeight: 150,
        decoration: InputDecoration(
          labelText: widget.labelText,
        ),
        selectedItemBuilder: (context) {
          return widget.items.map<Widget>((String value) {
            return Text(value);
          }).toList();
        },
        items: _dropMenuItems(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
            widget.controller.text = value.toString();
          });
        },
        validator: (value) {
          if (value == null) {
            return 'Campo obrigatório'; // TODO: Traduções
          }
          return null;
        },
      ),
    );
  }

  List<DropdownMenuItem<dynamic>> _dropMenuItems() {
    return widget.items.map((String value) {
      return DropdownMenuItem<dynamic>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
