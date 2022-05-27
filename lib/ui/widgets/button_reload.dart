import 'package:chat_enset_app/bloc/contact_bloc.dart';
import 'package:chat_enset_app/bloc/contact_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonReload extends StatelessWidget {

  const ButtonReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      ContactBloc contactBloc=context.read<ContactBloc>();
      if(contactBloc.lastEvent=="All"){
        context.read<ContactBloc>().add(LoadAllContactsEvent());
      }else if(contactBloc.lastEvent=="BDDC"){
        context.read<ContactBloc>().add(LoadBDDCContactsEvent());
      }else if(contactBloc.lastEvent=="GLSID"){
        context.read<ContactBloc>().add(LoadGLSIDConctactsEvent());
      }

    }, child: Text("Reload"));
  }
}
