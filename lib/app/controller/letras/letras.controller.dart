import 'package:mobx/mobx.dart';
import 'package:palavras/app/models/letras/letras.model.dart';
import 'package:palavras/app/repository/letras/letras.interface.dart';
import 'package:palavras/app/repository/letras/letras.repository.dart';

part "letras.controller.g.dart";

class LetrasController = _LetrasController with _$LetrasController;

abstract class _LetrasController with Store {
  ILetrasRepository letrasRepository = LetrasRepository();

  @observable
  ObservableStream<List<LetrasModel>> letrasList;

  _LetrasController() {
    this.getLetras();
  }

  @action
  getLetras() {
    letrasList = letrasRepository.getLetras().asObservable();
  }
}
