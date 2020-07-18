import 'package:cloud_firestore/cloud_firestore.dart';

class LetrasModel {
  String nome;
  String conjunto;
  DocumentReference reference;

  LetrasModel({this.nome, this.reference, this.conjunto});

  factory LetrasModel.fromDocument(DocumentSnapshot doc) {
    return LetrasModel(
        nome: doc["nome"], conjunto: doc["conjunto"], reference: doc.reference);
  }
}
