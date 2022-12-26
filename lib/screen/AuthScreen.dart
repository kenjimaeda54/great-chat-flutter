import 'package:flutter/material.dart';
import 'package:great_chat/widget/AuthForm.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [AuthForm()],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
