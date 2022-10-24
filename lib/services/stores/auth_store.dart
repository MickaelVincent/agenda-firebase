import 'package:Kanban/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

// This is the class used by rest of your codebase
class AuthStore = _Auth with _$AuthStore;

// The store-class
abstract class _Auth with Store {
  @observable
  int value = 0;

  @action
  Future<String> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return 'Unknown Error Occurred';
      }
    }
  }

  @action
  Future<String> signUp(String email, String password, String nickName) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => FirebaseDatabase.instance
              .ref("users/${value.user!.uid}")
              .set(UserModel.initUserInDb(nickName)));
      return "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'An account already exists for that email.';
      } else {
        return "Unknown Error Occurred";
      }
    }
  }

  @action
  void increment() {
    value++;
  }
}
