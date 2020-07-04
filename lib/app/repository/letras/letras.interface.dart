import 'package:palavras/app/models/letras/letras.model.dart';

abstract class ILetrasRepository {
  Stream<List<LetrasModel>> getLetras();
}
