import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
              CachedNetworkImage(
                imageUrl:
                'https://cdn-icons-png.flaticon.com/512/11218/11218238.png',
                height: 150,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                const CircularProgressIndicator(), // пока грузится
                errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: Colors.red), // если ошибка
              ),

              const SizedBox(height: 20),

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
