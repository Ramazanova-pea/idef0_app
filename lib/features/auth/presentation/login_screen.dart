import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idef0_app/features/auth/presentation/register_screen.dart';
import '../../../core/providers/app_state_provider.dart';
import '../../ui/main_screen.dart';

class AuthScreen extends ConsumerStatefulWidget  {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  String _imageUrl =
      'https://cdn-icons-png.flaticon.com/512/11218/11218238.png';
  final String _errorImageUrl =
      'https://cdn-icons-png.flaticon.com/512/4225/4225690.png';

  void _tryLogin() {
    if (_formKey.currentState!.validate()) {
      ref.read(appStateProvider.notifier).login(_loginController.text);
      setState(() {
        _imageUrl =
        'https://cdn-icons-png.flaticon.com/512/11218/11218238.png';
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      setState(() {
        _imageUrl = _errorImageUrl;
      });
    }
  }

  void _navigateToRegister() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

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
                imageUrl: _imageUrl,
                height: 150,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                // пока грузится
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Colors.red), // если ошибка
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: _loginController,
                decoration: const InputDecoration(labelText: 'Логин'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Введите логин' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Пароль'),
                obscureText: true,
                validator: (value) => value != null && value.length >= 6
                    ? null
                    : 'Минимум 6 символов',
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _tryLogin, child: const Text('Войти')),
              TextButton(
                onPressed: _navigateToRegister,
                child: const Text('Создать аккаунт'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
