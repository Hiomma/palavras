import 'package:palavras/app/models/conjuntos/conjuntos.model.dart';

abstract class IConjuntosRepository {
  Stream<List<ConjuntosModel>> getConjuntos();
}
