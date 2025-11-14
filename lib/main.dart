import 'package:flutter/material.dart';
import 'package:idef0_app/core/app_state/app_state.dart';
import 'package:provider/provider.dart';

import 'core/app_state/app_state_data.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/register_screen.dart';
import 'features/ui/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppStateData appStateData = AppStateData();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppStateData>.value(
      value: appStateData,
      child: AppState(
        data: appStateData,
        child: MaterialApp(
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
        ),
      ),
    );
  }
}
