
import 'dart:math';

import 'package:chat_enset_app/model/contact_model.dart';
import 'package:chat_enset_app/model/message_model.dart';

class MessageRepository{
  List<Message> messages=[
   Message(id: 1, content: "Bonjour Ahmed", idContact: 1, sent: true, date: DateTime.parse('2022-05-27 12:18:04Z')),
   Message(id: 2, content: "Bonjour",idContact: 1, sent: false, date: DateTime.parse('2022-05-27 13:02:04Z')),
   Message(id: 3, content: "Bonsoir ", idContact: 2, sent: true, date: DateTime.parse('2022-05-27 14:10:04Z')),
   Message(id: 4, content: "Tout va bien !!", idContact: 2, sent: true, date: DateTime.parse('2022-05-27 14:11:04Z')),
   Message(id: 5, content: "Salut", idContact: 2, sent: false, date: DateTime.parse('2022-05-27 14:18:04Z')),
   Message(id: 6, content: "Je vais bien", idContact: 2, sent: false, date: DateTime.parse('2022-05-27 14:18:04Z')),
  ];

  Future<List<Message>> messagesByContact(int idContact)async{
    var future= await Future.delayed(Duration(seconds: 1));
    return messages.where((element) => element.idContact==idContact).toList();
  }

  Future<Message> addMessage(Message message)async{
    var future= await Future.delayed(Duration(seconds: 1));
    message.id=messages.length+1;
    message.date = DateTime.now();
    messages.add(message);
    return message;
  }

}

