import 'DataHandler.dart';
import 'DataHandlerSharedPreferences.dart';
import 'enum/TypeDataHandler.dart';

///Fornece um manipulador de base de dados
///de acordo com  o [TypeDataHandler] informado
class FactoryDataHandler {
  static DataHandler? getDataHandler(typeDataHandler) {
    switch (typeDataHandler) {
      case TypeDataHandler.sharedPreferences:
        return DataHandlerSharedPreferences();
      default:
        print(
            '<FactoryDataHandler> tipo do TypeDataHandler solicitado não existe!!');
        return null;
    }
  }
}
