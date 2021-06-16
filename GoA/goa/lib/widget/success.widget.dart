import 'package:flutter/material.dart';
import 'package:goa/widget/loading-button.widget.dart';

class Success extends StatelessWidget {
  var result;
  Function()? reset;

  Success({required this.result, required this.reset});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Text(
            this.result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: 'Big Shoulders Display',
            ),
          ),
          SizedBox(height: 20),
          LoadingButton(
            text: 'CALCULAR NOVAMENTE',
            funcao: this.reset,
            busy: false,
            invert: true,
          )
        ],
      ),
    );
  }
}
