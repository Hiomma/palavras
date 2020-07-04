// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conjuntos.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConjuntosController on _ConjuntosController, Store {
  final _$conjuntosListAtom = Atom(name: '_ConjuntosController.conjuntosList');

  @override
  ObservableStream<List<ConjuntosModel>> get conjuntosList {
    _$conjuntosListAtom.reportRead();
    return super.conjuntosList;
  }

  @override
  set conjuntosList(ObservableStream<List<ConjuntosModel>> value) {
    _$conjuntosListAtom.reportWrite(value, super.conjuntosList, () {
      super.conjuntosList = value;
    });
  }

  final _$_ConjuntosControllerActionController =
      ActionController(name: '_ConjuntosController');

  @override
  dynamic getConjuntos() {
    final _$actionInfo = _$_ConjuntosControllerActionController.startAction(
        name: '_ConjuntosController.getConjuntos');
    try {
      return super.getConjuntos();
    } finally {
      _$_ConjuntosControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
conjuntosList: ${conjuntosList}
    ''';
  }
}
