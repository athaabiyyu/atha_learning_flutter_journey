import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> value;
  final double width;
  final String hintText;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.width,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items = value.map((value) {
      return DropdownMenuItem(value: value, child: Text(value));
    }).toList();

    return SizedBox(
      width: width,
      child: DropdownButton(
          items: items,
          hint: Text(
            hintText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          underline: Container(),
          iconEnabledColor: Colors.white,
          onChanged: (_) {}),
    );
  }
}
