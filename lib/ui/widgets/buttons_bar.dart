import 'package:chat_enset_app/bloc/contact_bloc.dart';
import 'package:chat_enset_app/bloc/contact_event.dart';
import 'package:chat_enset_app/ui/widgets/button_contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ButtonsBar extends StatelessWidget {
  const ButtonsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonContact(contactEvent: LoadAllContactsEvent(), text: "All"),
        ButtonContact(contactEvent: LoadBDDCContactsEvent(), text: "BDDC"),
        ButtonContact(contactEvent: LoadGLSIDConctactsEvent(), text: "GLSID"),],
    );
  }
}
