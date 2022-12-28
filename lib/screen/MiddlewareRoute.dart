import 'package:flutter/material.dart';
import 'package:great_chat/models/ChatUser.dart';
import 'package:great_chat/models/MockUserService.dart';
import 'package:great_chat/screen/AuthScreen.dart';
import 'package:great_chat/screen/ChatUserScreen.dart';
import 'package:great_chat/screen/LoadingScreen.dart';

class MiddlewareRoute extends StatelessWidget {
  const MiddlewareRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChatUser?>(
        stream: MockUserService().userChanges,
        //minha classe e estatica por isso não preciso instanciar
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          return snapshot.hasData ? const ChatUserScreen() : const AuthScreen();
        });
  }
}
