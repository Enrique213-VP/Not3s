import 'package:flutter/material.dart';

import '../db/db.dart';
import '../models/note.dart';

class SavePage extends StatelessWidget {
  static const String ROUTE = "/save";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guardar"),
      ),
      body: Container(
        child: _FormSave(),
      ),
    );
  }
}

class _FormSave extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: titleController,
            validator: (value){
              if(value!.isEmpty){
                return "You have to write some";
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: contentController,
            maxLines: 8,
            maxLength: 300,
            validator: (value){
              if(value!.isEmpty){
                return "You have to write some";
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: "Explain",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
          ),
          ElevatedButton(onPressed: (){
            if(_formKey.currentState!.validate()){
              print("Save: " + titleController.text);

              Db.insertNote(Note(title: titleController.text, content: contentController.text));
            }
          }, child: Text("Save"))
        ],
      ),
    ));
  }
}
