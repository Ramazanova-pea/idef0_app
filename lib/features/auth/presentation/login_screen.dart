import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final void Function(String login, String password) onLogin;
  final VoidCallback onRegisterTap;

  const AuthScreen({required this.onLogin, required this.onRegisterTap, super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Авторизация')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _loginController,
                decoration: const InputDecoration(labelText: 'Логин'),
                validator: (value) => value == null || value.isEmpty ? 'Введите логин' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Пароль'),
                obscureText: true,
                validator: (value) =>
                value != null && value.length >= 6 ? null : 'Минимум 6 символов',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onLogin(_loginController.text, _passwordController.text);
                  }
                },
                child: const Text('Войти'),
              ),
              TextButton(
                onPressed: widget.onRegisterTap,
                child: const Text('Создать аккаунт'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
