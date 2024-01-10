import 'package:app_kvina/toolbox/textbox.dart';
import 'package:app_kvina/view/login/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController tecUsername = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          const Text(
            'Kvina',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
          ),
          const SizedBox(height: 100),
          //Username
          TextBox(
            tecTextbox: tecUsername,
            label: 'Tài khoản',
            icon: const Icon(Icons.person),
          ),
          const SizedBox(height: 20),
          //Password
          TextBox(
            tecTextbox: tecPassword,
            label: 'Mật khẩu',
            icon: const Icon(Icons.lock),
            isPassword: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.login),
            label: const Text('Đăng nhập'),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: const Text('Quên mật khẩu',
                  style: TextStyle(fontStyle: FontStyle.italic)),
              onPressed: () => {},
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: const Text('Đăng ký tài khoản',
                  style: TextStyle(fontStyle: FontStyle.italic)),
              onPressed: () => {},
            ),
          ),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
