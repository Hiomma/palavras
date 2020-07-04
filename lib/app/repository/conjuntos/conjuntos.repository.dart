import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palavras/app/models/conjuntos/conjuntos.model.dart';
import 'package:palavras/app/repository/conjuntos/conjuntos.interface.dart';

class ConjuntosRepository implements IConjuntosRepository {
  Firestore firestore = Firestore();

  @override
  Stream<List<ConjuntosModel>> getConjuntos() {
    return firestore.collection("conjuntos").snapshots().map((query) {
      return query.documents.map((doc) {
        return ConjuntosModel.fromDocument(doc);
      }).toList();
    });
  }
}
