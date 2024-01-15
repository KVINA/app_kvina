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
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Title(),
            FormLogin(),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Kvina',
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
    );
  }
}

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);
  @override
  State<FormLogin> createState() => _FormLogin();
}

class _FormLogin extends State<FormLogin> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget lineSpacing() => const SizedBox(height: 16);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Welcome to Kvina!",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Enter your email and password to continue.",
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          lineSpacing(),
          TextBoxFormEmail(tecTextbox: _email),
          lineSpacing(),
          TextBoxFormPassword(tecTextbox: _password),
          lineSpacing(),
          CheckboxListTile(
            value: _rememberMe,
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _rememberMe = value;
              });
            },
            title: const Text('Remember me'),
            controlAffinity: ListTileControlAffinity.leading,
            dense: true,
            contentPadding: const EdgeInsets.all(0),
          ),
          lineSpacing(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  /// do something
                }
              },
            ),
          ),
          lineSpacing(),
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
              onPressed: () => {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        insetPadding: EdgeInsets.zero,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Nội dung dialog fullscreen',
                                style: TextStyle(fontSize: 18),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Đóng dialog khi người dùng chọn nút
                                  Navigator.of(context).pop();
                                },
                                child: Text('Đóng'),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
              },
            ),
          ),
        ],
      ),
    );
  }
}
