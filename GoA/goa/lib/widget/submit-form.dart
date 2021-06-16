import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:goa/widget/input.widget.dart';
import 'package:goa/widget/loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var busy = false;
  Function()? submitFunc;

  var gasolinaCntrl = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    initialValue: 0.00,
  );

  var alcoolCntrl = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    initialValue: 0.00,
  );

  SubmitForm({
    required this.gasolinaCntrl,
    required this.alcoolCntrl,
    required this.busy,
    required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: 'Gasolina:',
            controller: this.gasolinaCntrl,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: 'Álcool:',
            controller: this.alcoolCntrl,
          ),
        ),
        LoadingButton(
          text: 'CALCULAR',
          funcao: () {},
          busy: false,
          invert: false,
        ),
      ],
    );
  }
}
