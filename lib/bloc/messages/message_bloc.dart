import 'package:bloc/bloc.dart';
import 'package:chat_enset_app/bloc/contact_state.dart';
import 'package:chat_enset_app/bloc/messages/message_state.dart';
import 'package:chat_enset_app/bloc/messages/messages_event.dart';
import 'package:chat_enset_app/model/message_model.dart';
import 'package:chat_enset_app/repositories/message_repository.dart';

class MessageBloc extends Bloc<MessageEvent,MessageState>{
  MessageRepository messageRepository;
  MessageBloc({required MessageState initialState,required this.messageRepository}) : super(initialState){

    on((event, emit) async{
      if(event is ContactMessagesEvent){
        emit(MessageState(messages: [],requestState: RequestState.Loading,currentEvent: event));
       try{
         List<Message> messages=await messageRepository.messagesByContact(event.contact.id);
         emit(MessageState(messages: messages,requestState: RequestState.Loaded,currentEvent: event));
       }catch(e){
         emit(MessageState(messages: [],requestState: RequestState.Error,errorMessage: e.toString(),currentEvent: event));
       }
      }else if(event is AddMessageEvent){
        emit(MessageState(messages: [],requestState: RequestState.Loaded,currentEvent: event));
        try{
          messageRepository.addMessage(event.message);
          List<Message> messages=await messageRepository.messagesByContact(event.message.idContact);
          emit(MessageState(messages: messages,requestState: RequestState.Loaded,currentEvent: event));
        }catch(e){
          emit(MessageState(messages: [],requestState: RequestState.Error,errorMessage: e.toString(),currentEvent: event));
        }
      }
    });
  }


}