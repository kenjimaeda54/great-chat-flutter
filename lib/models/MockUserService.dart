import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:great_chat/models/ChatUser.dart';
import 'package:great_chat/services/AuthService.dart';

//essa classe ira implementar a nossa abastrata
class MockUserService implements AuthService {
  //https://www.devmedia.com.br/conceitos-e-exemplo-classes-e-membros-estaticos-estrutura-da-linguagem/18814
  //com metodo estatico não preciso instanciar a classe para executar
  static Map<String, ChatUser> _users = {};
  // se não criar metodo estatico objeto sempre sera limpado, porque não estamos estanciando um novo ojbeto
  //dessa classes em quem implementa ela
  //dai acusara apenas instance de ChatUser ou seja precisaremos instanciar eles
  static ChatUser? user;
  static MultiStreamController<ChatUser?>? _controllerUser;
  //generico precisa estar ao lado do Stream
  //se fizer sem o generio por exemplo static Stream<ChatUser> streamUser = ... codigo
  //não ira consegui resolver
  static final streamUser = Stream<ChatUser?>.multi((controler) {
    _controllerUser = controler;
    upadateUser(null);
    //membros estaticos precisam de metodos estaticos por isso func recebe a palavra static
  });

  @override
  Stream<ChatUser?> get userChanges => streamUser;

  @override
  ChatUser? get currentUser => user;

  @override
  Future<void> logOut() async {
    upadateUser(null);
  }

  @override
  Future<void> singUp(
      {required String name,
      required String email,
      required String password,
      required File? img}) async {
    try {
      final newUser = ChatUser(
        id: "${DateTime.now().millisecond} - ${Random().nextDouble().toString()}",
        name: name,
        email: email,
        imageUrl: img?.path ?? "../assets",
      );
      //estou chegando pelo email se não possuir sera inserido um novo user
      _users.putIfAbsent(email, () => newUser);
      upadateUser(newUser);
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> logIn({required String email, required String password}) async {
    try {
      upadateUser(_users[email]);
    } catch (error) {
      print(error);
    }
  }

  static void upadateUser(ChatUser? currentUser) {
    user = currentUser;
    _controllerUser?.add(currentUser);
  }
}
