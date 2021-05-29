import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        Image.asset(
          'assets/images/gao-white.png',
          height: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Gasolina ou Álcool',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Big Shoulders Display',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
