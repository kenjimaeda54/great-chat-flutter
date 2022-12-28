import 'package:flutter/material.dart';
import 'package:great_chat/models/MockUserService.dart';

class ChatUserScreen extends StatelessWidget {
  const ChatUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Chat Screen"),
            TextButton(
                onPressed: () => MockUserService().logOut(),
                child: Text("Sair"))
          ],
        ),
      )),
    );
  }
}
