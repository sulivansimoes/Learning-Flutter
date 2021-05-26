import 'dart:convert';

import 'package:lista_de_tarefas/models/to/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DataHandler.dart';

///Nome da base de dados da aplicação
final String keyPrefs = 'data';

class DataHandlerSharedPreferences implements DataHandler {
  @override
  void deleta(itens) {
    _salvaDadosSharedPreferences(itens).catchError((e) {
      print('<DataHandlerSharedPreferences> Erro na aplicação ' + e.toString());
    });
  }

  @override
  void salva(itens) {
    _salvaDadosSharedPreferences(itens).catchError((e) {
      print('<DataHandlerSharedPreferences> Erro na aplicação ' + e.toString());
    });
  }

  @override
  void altera(itens) {
    _salvaDadosSharedPreferences(itens).catchError((e) {
      print('<DataHandlerSharedPreferences> Erro na aplicação ' + e.toString());
    });
  }

  @override
  Future loadDados() async {
    Iterable dados;
    List<Item> result = [];
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(keyPrefs);

    //Após recuperar os dados do SharedPreferences
    //O jsonDecode Recupera objeto iteravel
    if (data != null) {
      dados = jsonDecode(data);
      result = dados.map((x) => Item.fromJson(x)).toList();
    }

    return result;
  }

  ///Salva as tarefas no SharedPreferences
  Future<void> _salvaDadosSharedPreferences(itens) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyPrefs, jsonEncode(itens));
  }
}
