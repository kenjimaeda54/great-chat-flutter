import 'dart:io';

enum AuthMode { login, signUp }

class AuthFormData {
  String name = "";
  String email = "";
  String password = "";
  File? image;
  AuthMode _mode = AuthMode.login;

  get isLogin {
    return _mode == AuthMode.login;
  }

  get isSignUp {
    return _mode == AuthMode.signUp;
  }

  void toggleAuth() {
    _mode = isSignUp ? AuthMode.login : AuthMode.signUp;
  }
}
