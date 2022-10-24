import 'package:flutter/material.dart';

import 'package:Kanban/widgets/login-widget/login_widget.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
      ),
      body: const LoginForm(),
    );
  }
}
