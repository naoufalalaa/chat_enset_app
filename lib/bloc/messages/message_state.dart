import 'package:chat_enset_app/bloc/contact_state.dart';
import 'package:chat_enset_app/bloc/messages/messages_event.dart';
import 'package:chat_enset_app/model/message_model.dart';

class MessageState{
  List<Message> messages;
  RequestState requestState;
  String errorMessage;
  MessageEvent currentEvent;
  MessageState({required this.messages, this.requestState=RequestState.NONE, this.errorMessage="",required this.currentEvent});
}