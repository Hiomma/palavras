import 'package:cloud_firestore/cloud_firestore.dart';

class PalavrasModel {
  String palavra;
  String letra;
  String path;
  List<String> letras;
  DocumentReference reference;

  PalavrasModel(
      {this.palavra, this.letra, this.letras, this.path, this.reference});

  factory PalavrasModel.fromDocument(DocumentSnapshot doc) {
    return PalavrasModel(
        palavra: doc["palavra"],
        letra: doc["letra"],
        letras: doc["letras"].cast<String>(),
        path: doc["path"],
        reference: doc.reference);
  }
}
