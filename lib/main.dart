import 'package:flutter/material.dart';
import '../features/auth/presentation/register_screen.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/ui/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isAuthScreen = true; // true -> экран входа, false -> экран регистрации
  bool _isLoggedIn = false; // true -> показываем MainScreen

  void _onLogin(String login, String password) {
    // здесь могла бы быть логика проверки логина/пароля
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _onRegister(String login, String password) {
    // здесь могла бы быть логика регистрации пользователя
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _switchToRegister() {
    setState(() {
      _isAuthScreen = false;
    });
  }

  void _switchToLogin() {
    setState(() {
      _isAuthScreen = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Blocks App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _isLoggedIn
          ? const MainScreen()
          : (_isAuthScreen
          ? AuthScreen(
        onLogin: _onLogin,
        onRegisterTap: _switchToRegister,
      )
          : RegisterScreen(
        onRegister: _onRegister,
      )),
    );
  }
}