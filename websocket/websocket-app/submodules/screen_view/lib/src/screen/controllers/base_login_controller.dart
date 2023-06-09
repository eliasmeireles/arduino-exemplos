import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:screen_view/screen_view.dart';

abstract class BaseLoginController<T extends BaseScreenNavigator>
    extends BaseController<T> {
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();

  final isObscuredText = BehaviorSubject<bool>.seeded(true);
  final isInputValid = BehaviorSubject<bool>.seeded(false);

  void onObscuredTextChange() => isObscuredText.value = !isObscuredText.value;

  bool get inputValidation =>
      emailPattern.hasMatch((emailTextController.text.trim())) &&
      passwordTextController.text.trim().length >= 6;

  void onStateChange() => isInputValid.value = inputValidation;

  void login();

  void loginSuccessful() {
    clear();
    isLoggedIn.value = true;
  }

  void clear() {
    emailTextController.clear();
    passwordTextController.clear();
  }

  @override
  @mustCallSuper
  doLogout() {
    clear();
    isLoggedIn.value = false;
    screenNavigator.pushReplacementNamed(loginPath);
  }
}
