import 'package:chat_enset_app/bloc/messages/message_state.dart';
import 'package:chat_enset_app/model/contact_model.dart';
import 'package:flutter/material.dart';

class ListMessagesWidget extends StatelessWidget {
  final MessageState state;
  final Contact contact;

  const ListMessagesWidget(
      {Key? key, required this.state, required this.contact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    return Expanded(
      child: ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                padding: const EdgeInsets.all(11),
                margin: state.messages[index].sent == true
                    ? const EdgeInsets.only(left: 100)
                    : const EdgeInsets.only(right: 100),
                // border radius
                decoration: BoxDecoration(
                  color: state.messages[index].sent == true
                    ? Colors.green[100]
                    : Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      state.messages[index].content,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                    Text(
                      (state.messages[index].date.hour).toString()+":"+(state.messages[index].date.minute).toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: state.messages.length),
    );
  }
}
