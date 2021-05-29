import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:goa/widget/logo.widget.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoA',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _gasCntrl = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    initialValue: 0.00,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Row(
            children: <Widget>[
              Container(
                width: 100,
                alignment: Alignment.centerRight,
                child: Text(
                  'Gasolina:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: 'Big Shoulders Display',
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _gasCntrl,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontFamily: 'Big Shoulders Display',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
