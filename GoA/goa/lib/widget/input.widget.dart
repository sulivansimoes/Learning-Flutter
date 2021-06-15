import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  var label = '';
  var controller = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    initialValue: 0.00,
  );

  Input({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 25,
        ),
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            this.label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: 'Big Shoulders Display',
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: this.controller,
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
    );
  }
}
