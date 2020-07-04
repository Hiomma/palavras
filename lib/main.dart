import 'package:flutter/material.dart';
import 'package:palavras/app/views/home/home.view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext hascontext) {
    return MaterialApp(
      title: 'Mundo das Palavras',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
