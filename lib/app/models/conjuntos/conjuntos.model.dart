import 'package:cloud_firestore/cloud_firestore.dart';

class ConjuntosModel {
  String nome;
  DocumentReference reference;

  ConjuntosModel({this.nome, this.reference});

  factory ConjuntosModel.fromDocument(DocumentSnapshot doc) {
    return ConjuntosModel(nome: doc["nome"], reference: doc.reference);
  }
}
