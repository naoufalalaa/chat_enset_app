import 'package:chat_enset_app/bloc/contact_bloc.dart';
import 'package:chat_enset_app/bloc/contact_state.dart';
import 'package:chat_enset_app/bloc/messages/message_bloc.dart';
import 'package:chat_enset_app/bloc/messages/message_state.dart';
import 'package:chat_enset_app/bloc/messages/messages_event.dart';
import 'package:chat_enset_app/model/contact_model.dart';
import 'package:chat_enset_app/repositories/contact_repository.dart';
import 'package:chat_enset_app/repositories/message_repository.dart';
import 'package:chat_enset_app/ui/pages/contacts_page.dart';
import 'package:chat_enset_app/ui/pages/home_page.dart';
import 'package:chat_enset_app/ui/pages/message_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>ContactBloc( ContactState(contacts: [], requestState: RequestState.NONE, errorMessage: ""), ContactRepository())),
          BlocProvider(create: (context)=>MessageBloc(initialState: MessageState(messages: [],currentEvent: ContactMessagesEvent(contact: Contact())), messageRepository: MessageRepository()),)
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            "/":(context)=>HomePage(),
            "/contacts":(context)=> ContactPage(),
            "/messages":(context)=>MessagesPage(),
          },
        ));
  }
}
