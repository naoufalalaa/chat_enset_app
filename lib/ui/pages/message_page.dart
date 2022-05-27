import 'package:chat_enset_app/bloc/contact_state.dart';
import 'package:chat_enset_app/bloc/messages/message_bloc.dart';
import 'package:chat_enset_app/bloc/messages/message_state.dart';
import 'package:chat_enset_app/bloc/messages/messages_event.dart';
import 'package:chat_enset_app/model/contact_model.dart';
import 'package:chat_enset_app/model/message_model.dart';
import 'package:chat_enset_app/ui/widgets/button_reload_messages.dart';
import 'package:chat_enset_app/ui/widgets/list_messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   TextEditingController editingController=TextEditingController();
    Contact contact=ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 59, 59, 1),
      appBar: AppBar(
        leading:IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(child: Text(contact.profile)),
            Text("  "+contact.name),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            BlocBuilder<MessageBloc,MessageState>(builder: (context, state) {
              if(state.requestState==RequestState.Loading){
                return const CircularProgressIndicator();
              }else if (state.requestState==RequestState.Loaded){
                return ListMessagesWidget(state: state,contact: contact);
              }else if(state.requestState==RequestState.Error){
                return Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Text(state.errorMessage),
                      ButtonReloadMessage(state: state),
                    ],
                  ),
                );
              }else {
                return Container();
              }
            }),
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                    controller: editingController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xDFE5E5E5),
                      focusColor: Colors.white,
                      hintText: "Type your message",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  )),
              IconButton(
                  onPressed: (){
                   Message message=Message(
                       idContact: contact.id,
                       content: editingController.text,
                       sent: true,
                       date: DateTime.now()
                      );
                    context.read<MessageBloc>().add(AddMessageEvent(message: message));
                  },
                  icon: const Icon(Icons.send_rounded , color: Colors.blue)
              ),
            ],
          )

          ]
        ),
      ),
    );
  }
}
