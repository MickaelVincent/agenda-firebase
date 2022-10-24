import 'package:Kanban/services/stores/auth_store.dart';
import 'package:Kanban/widgets/auth-wrapper/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:Kanban/services/theme.dart';

final authStore = AuthStore();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanbans Manager',
      theme: appThemeLight,
      darkTheme: appThemeDark,
      themeMode: ThemeMode.system,
      home: const AuthWrapper(),
    );
  }
}
