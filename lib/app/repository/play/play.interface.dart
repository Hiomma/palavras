import 'package:palavras/app/models/letras/letras.model.dart';
import 'package:palavras/app/models/palavras/palavras.model.dart';

abstract class IPalavrasRepository {
  Stream<List<PalavrasModel>> getPalavras();
  Future<List<PalavrasModel>> getPalavrasByLetra(LetrasModel letrasModel);
}
