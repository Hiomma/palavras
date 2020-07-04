import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:palavras/app/models/palavras/palavras.model.dart';

part "play.controller.g.dart";

class PlayerController = _PlayController with _$PlayerController;

abstract class _PlayController with Store {
  FirebaseStorage firestorage = FirebaseStorage.instance;

  @observable
  String display = "";

  @action
  addDisplay(String value) {
    display += value;
  }

  @action
  eraseDisplay() {
    display = "";
  }

  Future<String> getImage(PalavrasModel palavra) async {
    return await firestorage.ref().child(palavra.path).getDownloadURL();
  }
}
