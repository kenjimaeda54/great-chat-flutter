import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      color: Colors.white,
      elevation: 5,
      child: Form(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 35,
            left: 25,
            right: 25,
          ),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Nome"),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("E-mail"),
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text("Senha"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
