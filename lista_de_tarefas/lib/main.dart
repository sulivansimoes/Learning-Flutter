import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/models/to/item.dart';

import 'models/FactoryDataHandler.dart';
import 'models/enum/TypeDataHandler.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final itens = <Item>[];

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState() {
    loadTarefas();
  }

  //Fornece manipulador da base de dados
  var dataBase =
      FactoryDataHandler.getDataHandler(TypeDataHandler.sharedPreferences);

  ///Controller do textBox para inclusão das tarefas.
  final newTaskCntrl = TextEditingController();

  ///Fornece mensagem de alerta para usuário informar a tarefa.
  final snackBar = SnackBar(
    content: const Text('Escreva a tarefa!', textAlign: TextAlign.center),
    backgroundColor: Colors.redAccent.shade700,
  );

  ///Adiciona a nova tarefa nos [itens] de acordo com que o usuário
  ///digitou no [TextFormField] presente no [AppBar]
  void addTarefa() {
    setState(() {
      if (newTaskCntrl.text.isNotEmpty) {
        widget.itens.add(Item(titulo: newTaskCntrl.text, feito: false));
        newTaskCntrl.clear();
        //Salva na base de dados
        dataBase!.salva(widget.itens);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  ///Remove tarefa da lista de tarefas conforme solicitaçao do usuário
  void deletaTarefa(index) {
    //Remove do Array da tela
    widget.itens.removeAt(index);

    //Remove da base de dados
    dataBase!.deleta(widget.itens);
  }

  ///Altera a tarefa na lista de tarefas conforme solicitação do usuário
  void alteraTarefa({required item, required feito}) {
    item.feito = feito;
    dataBase!.altera(widget.itens);
  }

  ///Carrega as tarefas da base de dados na tela
  void loadTarefas() {
    final tarefas = dataBase!.loadDados();
    tarefas.then((value) => {
          setState(() {
            widget.itens.addAll(value);
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold é a página que tela será desenhada
    return Scaffold(
        //AppBar Funciona como o Header da aplicação
        appBar: AppBar(
          //Cria um campo para que o usuário possa preencher.
          title: TextFormField(
              controller: newTaskCntrl,
              keyboardType: TextInputType.text,
              //Seta propriedades de estilo do texto digitado
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              //Decoration Equivalente a um placeholder do html
              decoration: const InputDecoration(
                  labelText: 'Digite a nova tarefa aqui..',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ))),
        ),
        body: ListView.builder(
          itemCount: widget.itens.length,
          itemBuilder: (BuildContext context, int index) {
            final item = widget.itens[index];
            //Dimissible fornece a retirada dos elementos da tela
            //ao deslisar o item da lista
            return Dismissible(
              key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
              child: CheckboxListTile(
                title: Text(item.titulo),
                value: item.feito,
                onChanged: (value) {
                  //Atualiza a tela conforme o click no checkBox
                  setState(() {
                    alteraTarefa(item: item, feito: value);
                  });
                },
              ),
              //Edita estilos visuais ao deslisar o item para o lado
              background: Container(
                color: Colors.redAccent.shade700.withOpacity(0.80),
                child: const Icon(Icons.delete),
                padding: const EdgeInsets.all(12),
                alignment: Alignment.centerLeft,
              ),
              //Habilita o deslize somente em uma direção
              direction: DismissDirection.startToEnd,
              //Seta a ação que será realizada quando feito o deslize
              onDismissed: (direction) {
                deletaTarefa(index);
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTarefa();
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.purple,
          tooltip: 'Adiciona nova tarefa',
        ));
  }
}
