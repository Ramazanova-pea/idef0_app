import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/text_data/domain/text_block_model.dart';
import '../features/text_data/presentation/text_editor_screen.dart';
import '../features/text_data/presentation/text_list_screen.dart';


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
          return RegisterScreen(
            onRegister: (String login, String password) {context.pop();
            },
          );
        },
      ),

      GoRoute(
        path: '/texts',
        name: 'texts',
        builder: (BuildContext context, GoRouterState state) {
          final List<TextBlockModel> blocks = [];

          return TextListScreen(
            blocks: blocks,
            onEdit: (TextBlockModel block) {
              context.push('/texts/edit', extra: block);
            },
            onDelete: (TextBlockModel block) {},
            onAdd: () {},
          );
        },
        routes: [
          GoRoute(
            path: 'edit',
            name: 'text_editor',
            builder: (BuildContext context, GoRouterState state) {
              final TextBlockModel? initialBlock = state.extra as TextBlockModel?;

              return TextEditorScreen(
                initialBlock: initialBlock,
                onSave: (TextBlockModel block) {
                  context.pop();
                },
              );
            },
          ),
        ],
      ),
    ],
  );
}
