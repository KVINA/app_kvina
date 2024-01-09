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
          Username(tecUsername: tecUsername),
          const SizedBox(height: 20),
          Password(tecPassword: tecPassword),
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

class Username extends StatelessWidget {
  final TextEditingController tecUsername;

  const Username({
    super.key,
    required this.tecUsername,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Tên người dùng',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      controller: tecUsername,
    );
  }
}

class Password extends StatelessWidget {
  final TextEditingController tecPassword;
  const Password({super.key, required this.tecPassword});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Mật khẩu',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      controller: tecPassword,
    );
  }
}
