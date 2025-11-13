import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/text_data/domain/text_block_model.dart';
import '../features/text_data/presentation/text_editor_screen.dart';
import '../features/text_data/presentation/text_list_screen.dart';

import '../features/ui/main_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/auth',
    routes: <RouteBase>[
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthScreen();
        },
      ),

      GoRoute(
        path: '/register',
        name: 'register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),

      GoRoute(
        path: '/texts',
        name: 'texts',
        builder: (BuildContext context, GoRouterState state) {
          return const MainScreen();
        },
        routes: [
          GoRoute(
            path: 'add',
            name: 'text_add',
            builder: (BuildContext context, GoRouterState state) {
              return TextEditorScreen(
                initialBlock: null,
                onSave: (TextBlockModel block) {
                  context.pop(block);
                },
              );
            },
          ),
          GoRoute(
            path: 'edit',
            name: 'text_edit',
            builder: (BuildContext context, GoRouterState state) {
              final TextBlockModel? initialBlock =
                  state.extra as TextBlockModel?;

              return TextEditorScreen(
                initialBlock: initialBlock,
                onSave: (TextBlockModel block) {
                  context.pop(block);
                },
              );
            },
          ),
        ],
      ),
    ],
  );
}
