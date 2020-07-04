import 'package:mobx/mobx.dart';
import 'package:palavras/app/models/conjuntos/conjuntos.model.dart';
import 'package:palavras/app/repository/conjuntos/conjuntos.interface.dart';
import 'package:palavras/app/repository/conjuntos/conjuntos.repository.dart';

part "conjuntos.controller.g.dart";

class ConjuntosController = _ConjuntosController with _$ConjuntosController;

abstract class _ConjuntosController with Store {
  IConjuntosRepository conjuntosRepository = ConjuntosRepository();

  @observable
  ObservableStream<List<ConjuntosModel>> conjuntosList;

  _ConjuntosController() {
    this.getConjuntos();
  }

  @action
  getConjuntos() {
    conjuntosList = conjuntosRepository.getConjuntos().asObservable();
  }
}
