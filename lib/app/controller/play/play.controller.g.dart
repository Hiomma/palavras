// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerController on _PlayController, Store {
  final _$displayAtom = Atom(name: '_PlayController.display');

  @override
  String get display {
    _$displayAtom.reportRead();
    return super.display;
  }

  @override
  set display(String value) {
    _$displayAtom.reportWrite(value, super.display, () {
      super.display = value;
    });
  }

  final _$_PlayControllerActionController =
      ActionController(name: '_PlayController');

  @override
  dynamic addDisplay(String value) {
    final _$actionInfo = _$_PlayControllerActionController.startAction(
        name: '_PlayController.addDisplay');
    try {
      return super.addDisplay(value);
    } finally {
      _$_PlayControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic eraseDisplay() {
    final _$actionInfo = _$_PlayControllerActionController.startAction(
        name: '_PlayController.eraseDisplay');
    try {
      return super.eraseDisplay();
    } finally {
      _$_PlayControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
display: ${display}
    ''';
  }
}
