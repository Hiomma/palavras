import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palavras/app/models/letras/letras.model.dart';
import 'package:palavras/app/models/palavras/palavras.model.dart';
import 'package:palavras/app/repository/palavras/palavras.interface.dart';

class PalavrasRepository implements IPalavrasRepository {
  Firestore firestore = Firestore();

  @override
  Stream<List<PalavrasModel>> getPalavras() {
    return firestore.collection("palavras").snapshots().map((query) {
      return query.documents.map((doc) {
        return PalavrasModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future<List<PalavrasModel>> getPalavrasByLetra(
      LetrasModel letrasModel) async {
    return await firestore
        .collection("palavras")
        .where("letra", isEqualTo: letrasModel.reference.documentID)
        .getDocuments()
        .then((query) async {
      return query.documents.map((doc) {
        return PalavrasModel.fromDocument(doc);
      }).toList();
    });
  }
}
