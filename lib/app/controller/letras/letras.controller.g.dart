// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letras.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LetrasController on _LetrasController, Store {
  final _$letrasListAtom = Atom(name: '_LetrasController.letrasList');

  @override
  ObservableStream<List<LetrasModel>> get letrasList {
    _$letrasListAtom.reportRead();
    return super.letrasList;
  }

  @override
  set letrasList(ObservableStream<List<LetrasModel>> value) {
    _$letrasListAtom.reportWrite(value, super.letrasList, () {
      super.letrasList = value;
    });
  }

  final _$_LetrasControllerActionController =
      ActionController(name: '_LetrasController');

  @override
  dynamic getLetras() {
    final _$actionInfo = _$_LetrasControllerActionController.startAction(
        name: '_LetrasController.getLetras');
    try {
      return super.getLetras();
    } finally {
      _$_LetrasControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
letrasList: ${letrasList}
    ''';
  }
}
