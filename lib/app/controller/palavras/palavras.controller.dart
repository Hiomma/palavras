import 'package:mobx/mobx.dart';
import 'package:palavras/app/models/letras/letras.model.dart';
import 'package:palavras/app/models/palavras/palavras.model.dart';
import 'package:palavras/app/repository/palavras/palavras.interface.dart';
import 'package:palavras/app/repository/palavras/palavras.repository.dart';

part "palavras.controller.g.dart";

class PalavrasController = _PalavrasController with _$PalavrasController;

abstract class _PalavrasController with Store {
  IPalavrasRepository palavrasRepository = PalavrasRepository();

  @observable
  ObservableStream<List<PalavrasModel>> palavrasList;

  _PalavrasController() {
    this.getPalavras();
  }

  @action
  void getPalavras() {
    palavrasList = palavrasRepository.getPalavras().asObservable();
  }

  @action
  Future<List<PalavrasModel>> getPalavrasByLetra(
      LetrasModel letrasModel) async {
    return await palavrasRepository.getPalavrasByLetra(letrasModel);
  }
}
