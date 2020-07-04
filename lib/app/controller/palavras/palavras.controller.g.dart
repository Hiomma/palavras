// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palavras.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PalavrasController on _PalavrasController, Store {
  final _$palavrasListAtom = Atom(name: '_PalavrasController.palavrasList');

  @override
  ObservableStream<List<PalavrasModel>> get palavrasList {
    _$palavrasListAtom.reportRead();
    return super.palavrasList;
  }

  @override
  set palavrasList(ObservableStream<List<PalavrasModel>> value) {
    _$palavrasListAtom.reportWrite(value, super.palavrasList, () {
      super.palavrasList = value;
    });
  }

  final _$getPalavrasByLetraAsyncAction =
      AsyncAction('_PalavrasController.getPalavrasByLetra');

  @override
  Future<List<PalavrasModel>> getPalavrasByLetra(LetrasModel letrasModel) {
    return _$getPalavrasByLetraAsyncAction
        .run(() => super.getPalavrasByLetra(letrasModel));
  }

  final _$_PalavrasControllerActionController =
      ActionController(name: '_PalavrasController');

  @override
  void getPalavras() {
    final _$actionInfo = _$_PalavrasControllerActionController.startAction(
        name: '_PalavrasController.getPalavras');
    try {
      return super.getPalavras();
    } finally {
      _$_PalavrasControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
palavrasList: ${palavrasList}
    ''';
  }
}
