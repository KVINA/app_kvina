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

class TextBoxFormEmail extends StatefulWidget {
  final String? label;
  final bool? isReadOnly;
  final bool? isPassword;
  final TextEditingController tecTextbox;
  const TextBoxFormEmail(
      {super.key,
      required this.tecTextbox,
      this.label,
      this.isReadOnly,
      this.isPassword});
  @override
  State<TextBoxFormEmail> createState() => _TextBoxFormEmail();
}

class _TextBoxFormEmail extends State<TextBoxFormEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        // add email validation
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value);
        if (!emailValid) {
          return 'Please enter a valid email';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: widget.label ?? 'Email',
        hintText: 'Enter your email',
        prefixIcon: const Icon(Icons.email),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      controller: widget.tecTextbox,
      readOnly: widget.isReadOnly ?? false,
      obscureText: widget.isPassword ?? false,
    );
  }
}

class TextBoxFormPhone extends StatefulWidget {
  final String? label;
  final bool? isReadOnly;
  final bool? isPassword;
  final TextEditingController tecTextbox;
  const TextBoxFormPhone(
      {super.key,
      required this.tecTextbox,
      this.label,
      this.isReadOnly,
      this.isPassword});
  @override
  State<TextBoxFormPhone> createState() => _TextBoxFormPhone();
}

class _TextBoxFormPhone extends State<TextBoxFormPhone> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        // add email validation
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        bool phoneValid = RegExp(r'^\d{10}$').hasMatch(value);
        if (!phoneValid) {
          return 'Please enter a valid email';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: widget.label ?? 'Phone',
        hintText: 'Enter your Phone',
        prefixIcon: const Icon(Icons.phone),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      controller: widget.tecTextbox,
      readOnly: widget.isReadOnly ?? false,
      obscureText: widget.isPassword ?? false,
    );
  }
}
