import 'package:chat_enset_app/bloc/contact_bloc.dart';
import 'package:chat_enset_app/bloc/contact_event.dart';
import 'package:chat_enset_app/bloc/contact_state.dart';
import 'package:chat_enset_app/ui/widgets/button_reload.dart';
import 'package:chat_enset_app/ui/widgets/buttons_bar.dart';
import 'package:chat_enset_app/ui/widgets/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Contacts")),
        body: Column(
            children: [
        BlocBuilder<ContactBloc,ContactState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.all(10),
              child: ButtonsBar(),
            );
          }),
    BlocBuilder<ContactBloc,ContactState>(
    builder: (context, state) {
    if(state.requestState==RequestState.Loading){
        return CircularProgressIndicator();
    }else if(state.requestState==RequestState.Loaded){
      return Expanded(
        child: ContactListView(state: state),
      );
    }else if(state.requestState==RequestState.Error){
      return Column(
        children: [
          Text("${state.errorMessage}"),
          ButtonReload(),
        ],
      );
    }
    else{
       return Center(child: Text("Aucun élément"),);
    }
    }),

    ])
    ,
    );
  }
}
