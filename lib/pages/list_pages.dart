import 'package:crud/pages/save_pages.dart';
import 'package:flutter/material.dart';

import '../db/db.dart';


class ListPage extends StatelessWidget{

  static const String ROUTE = "/";


  @override
  Widget build(BuildContext context){

    Db.notes();


    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: (){
        Navigator.pushNamed(context, SavePage.ROUTE);
      },),
      appBar: AppBar(title: const Text("Task"),),
      body: Container(child: ListView(children: <Widget>[
        ListTile(title: Text("Number One"),),
        ListTile(title: Text("Number One"),),
        ListTile(title: Text("Number One"),),
        ListTile(title: Text("Number One"),),
        ListTile(title: Text("Number One"),),
        ListTile(title: Text("Number One"),),
        ListTile(title: Text("Number One"),),
        ListTile(title: Text("Number One"),),
      ],),),
    );
  }
}