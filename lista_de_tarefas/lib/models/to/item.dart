//Para gerar o Json de forma mais automatica foi
//usado a ferramenta do link abaixo
//https://javiercbk.github.io/json_to_dart/
//ver -> https://dart.dev/null-safety

///Objeto de transferencia que representa o item/tarefa
class Item {
  late String titulo;
  late bool feito;

  Item({required this.titulo, this.feito = false});

  Item.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    feito = json['feito'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['feito'] = this.feito;
    return data;
  }
}
