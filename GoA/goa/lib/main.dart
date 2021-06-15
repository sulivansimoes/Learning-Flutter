import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:goa/widget/input.widget.dart';
import 'package:goa/widget/loading-button.widget.dart';
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
        primarySwatch: Colors.brown,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _gasolinaCntrl = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    initialValue: 0.00,
  );

  final _alcoolCntrl = MoneyMaskedTextController(
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
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Compensa por gasosa',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40,
                    fontFamily: 'Big Shoulders Display',
                  ),
                ),
                SizedBox(height: 20),
                LoadingButton(
                  text: 'CALCULAR NOVAMENTE',
                  funcao: () {},
                  busy: false,
                  invert: true,
                )
              ],
            ),
          ),
          Input(
            label: 'Gasolina:',
            controller: _gasolinaCntrl,
          ),
          Input(
            label: 'Álcool:',
            controller: _alcoolCntrl,
          ),
          LoadingButton(
            text: 'CALCULAR',
            funcao: () {},
            busy: true,
            invert: false,
          )
        ],
      ),
    );
  }
}
