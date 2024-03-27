import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CDLMultiSelectDropDown extends StatelessWidget {
  const CDLMultiSelectDropDown(
      {super.key,
      this.width,
      required this.itens,
      required this.selectedItems,
      required this.labelText});
  final double? width;
  final List<String> itens;
  final List<String> selectedItems;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      constraints:
          const BoxConstraints(minHeight: 64), // TODO: Ajustar o constraint
      alignment: Alignment.center,
      foregroundDecoration:
          _boxDecoration(Theme.of(context).inputDecorationTheme.enabledBorder!),
      decoration:
          _boxDecoration(Theme.of(context).inputDecorationTheme.enabledBorder!),
      child: MultiSelectBottomSheetField(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        buttonText: Text(
          labelText,
        ),
        buttonIcon: Icon(
          Icons.arrow_drop_down,
          color: Colors.grey.shade200,
        ),
        // decoration: _boxDecoration(
        //     Theme.of(context).inputDecorationTheme.enabledBorder!),
        listType: MultiSelectListType.CHIP,
        items: _menuItens(itens),
        onConfirm: (values) {
          selectedItems.clear();
          selectedItems.addAll(values.map((e) => e.toString()));
        },
      ),
    );
  }

  BoxDecoration _boxDecoration(InputBorder inputBorder) {
    return BoxDecoration(
      border: Border.all(
        color: (inputBorder as OutlineInputBorder).borderSide.color,
        width: inputBorder.borderSide.width,
      ),
      borderRadius: inputBorder.borderRadius,
    );
  }

  List<MultiSelectItem<dynamic>> _menuItens(List<String> itens) {
    return itens.map((String value) {
      return MultiSelectItem(value, value);
    }).toList();
  }
}
