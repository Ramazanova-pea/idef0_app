import 'package:flutter/material.dart';

import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/register_screen.dart';
import 'features/ui/main_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Editor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthScreen(),
        '/register': (context) => RegisterScreen(),
        '/texts': (context) => MainScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}