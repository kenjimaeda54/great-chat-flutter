//classes abstratas não podem ser instanciadas
import 'dart:io';
import 'package:great_chat/models/ChatUser.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  //toda vez que alterar o user sera notificado aqui
  Stream<ChatUser?> get userChanges;

  Future<void> singUp(
      {required String name,
      required String email,
      required String password,
      required File? img});

  Future<void> logIn({required String email, required String password});

  Future<void> logOut();
}
