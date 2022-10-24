import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:Kanban/utils/string_extension.dart';

import '../../main.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nickNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      String returnVal = await authStore.signUp(emailController.text,
          passwordController.text, nickNameController.text);
      if (returnVal != null && !returnVal.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(returnVal)));
      }
    }
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      authStore
          .signUp(emailController.text, passwordController.text,
              nickNameController.text)
          .then((value) => {
                if (value.isNotEmpty)
                  {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(value)))
                  }
                else
                  {Navigator.pop(context)}
              });
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
              controller: nickNameController,
              decoration: const InputDecoration(hintText: "Nickname"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a nickname';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: "Email"),
              validator: (value) {
                if (value == null || value.isEmpty || !value.isValidEmail()) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
          ),
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
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 30),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    signUp();
                  },
                  child: const Text("Sign Up")))
        ],
      ),
    );
  }
}
