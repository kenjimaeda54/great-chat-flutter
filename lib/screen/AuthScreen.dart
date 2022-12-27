import 'package:flutter/material.dart';
import 'package:great_chat/utils/AuthFormData.dart';
import 'package:great_chat/widget/AuthForm.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    void handleForm(AuthFormData form) {
      setState(() => isLoading = true);
      print(form.email);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      //o Stack não pode ter um column acima dele,
      //caso possuir o container abaixo não ira consegui ocupar tudo
      body: Stack(
        children: [
          //singleScrollView vai ajudar na responsivdade do formulario
          //ele vai crescer se necessario
          Center(child: SingleChildScrollView(child: AuthForm(handleForm))),
          if (isLoading)
            Container(
              color: const Color.fromRGBO(0, 0, 0, 0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
