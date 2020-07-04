import 'package:cloud_firestore/cloud_firestore.dart';

class LetrasModel {
  String nome;
  DocumentReference reference;

  LetrasModel({this.nome, this.reference});

  factory LetrasModel.fromDocument(DocumentSnapshot doc) {
    return LetrasModel(nome: doc["nome"], reference: doc.reference);
  }
}
