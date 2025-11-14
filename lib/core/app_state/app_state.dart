import 'package:flutter/material.dart';
import 'app_state_data.dart';


class AppState extends InheritedWidget{
  final AppStateData data;

  const AppState({
    super.key,
    required super.child,
    required this.data,
  });

  static AppState of(BuildContext context) {
    final AppState? result = context.dependOnInheritedWidgetOfExactType<AppState>();
    assert(result != null, 'No AppState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return data != oldWidget.data;
  }
}



