import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
           DrawerHeader(child: Column(
             children: [
               CircleAvatar(
                 radius: 55,
               ),
               SizedBox(height: 10, ),
               Text("Naoufal ALAA"),
             ],
              ),
           ),
        ListTile(
          title: Text("Home"),
          onTap: (){
            Navigator.pushNamed(context, "/");
          },
        ),
        ListTile(
          title: Text("Contacts"),
          onTap: (){
            Navigator.pushNamed(context, "/contacts");
          },
        )],
      ),
    );
  }
}
