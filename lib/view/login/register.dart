import 'package:app_kvina/toolbox/textbox.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final TextEditingController tecPhone = TextEditingController();
  final TextEditingController tecMail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Wrap(
          children: [
            TextBox(
              tecTextbox: tecPhone,
              label: 'Phone',
            ),
            TextBox(
              tecTextbox: tecMail,
              label: 'Mail',
            ),
            TextBox(
              tecTextbox: tecMail,
              label: 'Mật khẩu',
            ),
            TextBox(
              tecTextbox: tecMail,
              label: 'Nhập lại mật khẩu',
            ),
          ],
        )
      ],
    ));
  }
}
