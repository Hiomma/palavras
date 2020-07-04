import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palavras/app/models/letras/letras.model.dart';
import 'package:palavras/app/repository/letras/letras.interface.dart';

class LetrasRepository implements ILetrasRepository {
  Firestore firestore = Firestore();

  @override
  Stream<List<LetrasModel>> getLetras() {
    return firestore.collection("letras").snapshots().map((query) {
      return query.documents.map((doc) {
        return LetrasModel.fromDocument(doc);
      }).toList();
    });
  }
}
