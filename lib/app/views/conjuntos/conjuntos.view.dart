import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:palavras/app/controller/conjuntos/conjuntos.controller.dart';
import 'package:palavras/app/controller/letras/letras.controller.dart';
import 'package:palavras/app/controller/palavras/palavras.controller.dart';
import 'package:palavras/app/models/conjuntos/conjuntos.model.dart';
import 'package:palavras/app/models/letras/letras.model.dart';
import 'package:palavras/app/models/palavras/palavras.model.dart';
import 'package:palavras/app/views/play/play.view.dart';

class Conjuntos extends StatefulWidget {
  @override
  _ConjuntosState createState() => _ConjuntosState();
}

class _ConjuntosState extends State<Conjuntos> {
  ConjuntosController conjuntosController = ConjuntosController();
  LetrasController letrasController = LetrasController();
  PalavrasController palavrasController = PalavrasController();

  makeConjuntosList() {
    List<ConjuntosModel> conjuntosList = conjuntosController.conjuntosList.data;
    List<LetrasModel> letrasList = letrasController.letrasList.data;
    final List<Widget> listWidget = List<Widget>();

    if (conjuntosList == null || letrasList == null) {
      return [
        Center(
          child: CircularProgressIndicator(),
        )
      ];
    }

    if (conjuntosController.conjuntosList.hasError) {
      return Center(
          child: RaisedButton(
        child: Text(conjuntosController.conjuntosList.error),
        onPressed: conjuntosController.getConjuntos,
      ));
    }

    if (letrasController.letrasList.hasError) {
      return Center(
          child: RaisedButton(
        child: Text(letrasController.letrasList.error),
        onPressed: letrasController.getLetras,
      ));
    }

    for (final conjunto in conjuntosList) {
      listWidget.add(
        Expanded(
          child: Observer(
            builder: (_) {
              return GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                padding: EdgeInsets.all(4),
                children: List.generate(
                  letrasList.length,
                  (index) {
                    final LetrasModel letra = letrasList[index];

                    return Observer(
                      builder: (_) {
                        return RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text(
                            letra.nome,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            final List<PalavrasModel> palavras =
                                await palavrasController
                                    .getPalavrasByLetra(letra);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Play(palavras, letra.nome)));
                          },
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      );
    }

    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Conjuntos"),
      ),
      body: Container(
        child: Observer(builder: (_) {
          return Column(children: makeConjuntosList());
        }),
      ),
    );
  }
}
