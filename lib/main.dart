import 'package:crud/pages/list_pages.dart';
import 'package:crud/pages/save_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp ());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: ListPage.ROUTE,
      routes: {
        ListPage.ROUTE : (_) => ListPage(),
        SavePage.ROUTE : (_) => SavePage()
      },
    );
  }
}