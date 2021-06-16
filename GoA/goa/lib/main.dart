import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:goa/widget/input.widget.dart';
import 'package:goa/widget/loading-button.widget.dart';
import 'package:goa/widget/logo.widget.dart';
import 'package:goa/widget/submit-form.dart';
import 'package:goa/widget/success.widget.dart';

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
        body: ListView(children: <Widget>[
          Logo(),
          SubmitForm(
            alcoolCntrl: this._alcoolCntrl,
            gasolinaCntrl: this._gasolinaCntrl,
            busy: false,
            submitFunc: () {},
          ),
        ]));
  }
}
