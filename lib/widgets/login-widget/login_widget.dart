import 'package:Kanban/main.dart';
import 'package:Kanban/screens/login-register/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:Kanban/utils/string_extension.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      String returnVal =
          await authStore.signIn(emailController.text, passwordController.text);
      if (returnVal.isNotEmpty) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(returnVal)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
              child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.isValidEmail()) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  })),
          Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
              child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: "Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  })),
          Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 30),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  onPressed: () {
                    signIn();
                  },
                  child: const Text("Sign In"))),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            width: double.infinity,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("No account yet ?"),
              TextButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => SignUpPage(),
                      ),
                    );
                  },
                  child: const Text("go to signUp")),
            ]),
          ),
        ],
      ),
    );
  }
}
