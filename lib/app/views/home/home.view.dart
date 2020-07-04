import 'package:flutter/material.dart';
import 'package:palavras/app/views/conjuntos/conjuntos.view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 250,
        child: FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8),
          child: Text(
            "Iniciar",
          ),
          onPressed: () {
            playGame();
          },
        ),
      ),
    ));
  }

  void playGame() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Conjuntos()));
  }
}
