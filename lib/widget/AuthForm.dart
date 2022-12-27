import 'package:flutter/material.dart';
import 'package:great_chat/utils/AuthFormData.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  // classe precisa estar fora do metodo build
  AuthFormData form = AuthFormData();
  GlobalKey<FormState> formSubmit = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void handleCreateAcount() {
      setState(() {
        form.toggleAuth();
      });
    }

    void handleSubmit() {
      final validate = formSubmit.currentState?.validate() ?? false;
      if (!validate) return;
    }

    String? handleNameValidate(String? text) {
      final validateText = text ?? "";
      final validate = validateText.length > 4;
      if (!validate) {
        return "Nome precisa ser maior que 5 caracter";
      }
      return null;
    }

    String? handleValidateEmail(String? text) {
      final validateText = text ?? "";
      final validate = !validateText.contains("@");
      if (validate) {
        return "Email precisa ser valido";
      }
      return null;
    }

    String? handlePassWord(String? text) {
      final validateText = text ?? "";
      final validate = validateText.length >= 6;
      if (!validate) {
        return "Senha  possuir 6 ou mais caracter";
      }
      return null;
    }

    return Card(
      margin: const EdgeInsets.all(15),
      color: Colors.white,
      elevation: 5,
      child: Form(
        key: formSubmit,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 35,
            left: 25,
            right: 25,
          ),
          child: Column(
            children: [
              if (form.isSignUp)
                TextFormField(
                  initialValue: form.name,
                  validator: (name) => handleNameValidate(name),
                  key: const Key(
                      "name"), //quando eu sair e voltar o Flutter ira embaralhar os campos
                  //dessa maneira não ocorre
                  onChanged: (name) => setState(() {
                    form.name = name;
                  }),
                  decoration: const InputDecoration(
                    label: Text("Nome"),
                  ),
                ),
              TextFormField(
                key: const Key("email"),
                validator: (email) => handleValidateEmail(email),
                decoration: const InputDecoration(
                  label: Text("E-mail"),
                ),
              ),
              TextFormField(
                key: const Key("password"),
                validator: (password) => handlePassWord(password),
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text("Senha"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: handleSubmit,
                child: form.isSignUp
                    ? const Text("Cadastrar")
                    : const Text("Entrar"),
              ),
              TextButton(
                onPressed: handleCreateAcount,
                child: form.isSignUp
                    ? const Text("Já possui conta?")
                    : const Text("Criar uma conta?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
