
import 'dart:math';

import 'package:chat_enset_app/model/contact_model.dart';

class ContactRepository{
  List<Contact> contacts=[
    Contact(id: 1, name: "Ahmed", group: "GLSID", profile: "AH"),
    Contact(id: 2, name: "Imane", group: "BDDC", profile: "IM"),
    Contact(id: 3, name: "Rachid", group: "GLSID", profile: "RA"),
    Contact(id: 4, name: "Kamal", group: "BDDC", profile: "KA"),
    Contact(id: 5, name: "Hajar", group: "GLSID", profile: "Ha"),
    Contact(id: 6, name: "Asmae", group: "GLSID", profile: "As"),
  ];

  Future<List<Contact>> allContacts()async{
      var future= await Future.delayed(Duration(seconds: 1));
      return contacts;
  }
  Future<List<Contact>> contactsByGroup(String group)async{
    var future= await Future.delayed(Duration(seconds: 1));
    return contacts.where((element) => element.group==group).toList();
  }
}