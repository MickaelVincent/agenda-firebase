import 'package:Kanban/screens/home/home.dart';
import 'package:Kanban/screens/login-register/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  AuthWrapperState createState() => AuthWrapperState();
}

class AuthWrapperState extends State<AuthWrapper> {
  Future<void> initializeDefault() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  User? user;

  @override
  void initState() {
    initializeDefault().then((value) => FirebaseAuth.instance
        .authStateChanges()
        .listen((event) => updateUserState(event)));
    super.initState();
  }

  updateUserState(event) {
    setState(() {
      user = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return SignPage();
    } else {
      return const HomePage();
    }
  }
}
