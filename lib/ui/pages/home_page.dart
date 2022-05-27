import 'package:chat_enset_app/ui/widgets/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Home page")),
      body: Center(
        child: Text("Page Home"),
      ),
      drawer: AppDrawer(),
    );
  }
}
