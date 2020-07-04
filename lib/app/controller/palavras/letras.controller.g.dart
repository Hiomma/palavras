// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letras.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LetrasController on _LetrasController, Store {
  final _$letrasListAtom = Atom(name: '_LetrasController.letrasList');

  @override
  ObservableStream<List<LetrasModel>> get letrasList {
    _$letrasListAtom.context.enforceReadPolicy(_$letrasListAtom);
    _$letrasListAtom.reportObserved();
    return super.letrasList;
  }

  @override
  set letrasList(ObservableStream<List<LetrasModel>> value) {
    _$letrasListAtom.context.conditionallyRunInAction(() {
      super.letrasList = value;
      _$letrasListAtom.reportChanged();
    }, _$letrasListAtom, name: '${_$letrasListAtom.name}_set');
  }

  final _$_LetrasControllerActionController =
      ActionController(name: '_LetrasController');

  @override
  dynamic getLetras() {
    final _$actionInfo = _$_LetrasControllerActionController.startAction();
    try {
      return super.getLetras();
    } finally {
      _$_LetrasControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'letrasList: ${letrasList.toString()}';
    return '{$string}';
  }
}
