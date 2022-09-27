import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/note.dart';

class Db {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'notes.db'),
        onCreate: (db, version) {
      //Query
      return db.execute(
          "CREATE TABLE  notes (id INTEGER PRIMARY KEY, title TEXT, content TEXT)");
    }, version: 1);
  }

  static Future<void> insertNote(Note note) async {
    Database database = await _openDB();
    
    database.insert("notes", note.toMap());
  }

  static Future<List<Note>> notes() async{
    Database database = await _openDB();

    final List<Map<String, dynamic>> notesMAp = await database.query("notes");

    for ( var n in notesMAp){
      print("____" +  n['title']);
    }

    return List.generate(notesMAp.length, (i) => Note(id: notesMAp[i]['id'], title: notesMAp[i]['title'], content: notesMAp[i]['content']));
  }
}
