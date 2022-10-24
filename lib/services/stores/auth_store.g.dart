// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _Auth, Store {
  late final _$valueAtom = Atom(name: '_Auth.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_Auth.signIn', context: context);

  @override
  Future<String> signIn(String email, String password) {
    return _$signInAsyncAction.run(() => super.signIn(email, password));
  }

  late final _$signUpAsyncAction =
      AsyncAction('_Auth.signUp', context: context);

  @override
  Future<String> signUp(String email, String password, String nickName) {
    return _$signUpAsyncAction
        .run(() => super.signUp(email, password, nickName));
  }

  late final _$_AuthActionController =
      ActionController(name: '_Auth', context: context);

  @override
  void increment() {
    final _$actionInfo =
        _$_AuthActionController.startAction(name: '_Auth.increment');
    try {
      return super.increment();
    } finally {
      _$_AuthActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
