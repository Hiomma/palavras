import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:palavras/app/models/palavras/palavras.model.dart';

class PlayRepository implements IPlayRepository {
  Firestore firestore = Firestore.instance;
  FirebaseStorage firestorage = FirebaseStorage.instance;

  @override
  Future<List<PalavrasModel>> getStorageImages(
      List<PalavrasModel> palavrasList) async {
    final pathList = List<String>();

    for (var palavras in palavrasList) {
      final String path =
          await firestorage.ref().child(palavras.path).getDownloadURL();

      pathList.add(path);
    }

    return pathList;
  }
}
