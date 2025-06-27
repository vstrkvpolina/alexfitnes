//alexfitnes/lib/services/api_service.dart
import 'package:flutter/material.dart';
import 'package:alexfitnes/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  String? _message;

  void _login() async {
    final login = _loginController.text.trim();
    final password = _passwordController.text.trim();

    final role = await _authService.login(login, password);

    setState(() {
      if (role != null) {
        _message = 'Вы вошли как: $role';
      } else {
        _message = 'Ошибка авторизации';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Авторизация')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _loginController,
              decoration: InputDecoration(labelText: 'Логин'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Пароль'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Войти'),
            ),
            SizedBox(height: 20),
            if (_message != null)
              Text(
                _message!,
                style: TextStyle(
                  color: _message!.startsWith('Ошибка') ? Colors.red : Colors.green,
                  fontSize: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
