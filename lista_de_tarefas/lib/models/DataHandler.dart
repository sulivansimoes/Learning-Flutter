///Interface deve ser assinada pelas classes que maninpulam base de dados
abstract class DataHandler {
  ///Deve salvar tarefa na base de dados.
  void salva(item);

  ///Deve deletar tarefa da base de dados.
  void deleta(item);

  ///Altera tarefa na base de dados.
  void altera(item);

  ///Retorna todos os itens da base de dados.
  Future loadDados();
}
