import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String? label;
  final Icon? icon;
  final bool? isReadOnly;
  final bool? isPassword;
  final TextEditingController tecTextbox;
  const TextBox(
      {super.key,
      required this.tecTextbox,
      this.label,
      this.icon,
      this.isReadOnly,
      this.isPassword});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label ?? ''),
        prefixIcon: icon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      controller: tecTextbox,
      readOnly: isReadOnly ?? false,
      obscureText: isPassword ?? false,
    );
  }
}
