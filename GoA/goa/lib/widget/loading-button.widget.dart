import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  Function()? funcao;
  var text = '';

  LoadingButton({
    required this.busy,
    required this.invert,
    required this.text,
    required this.funcao,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            height: 60,
            width: double.infinity,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: this.invert
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: TextButton(
              child: Text(
                this.text,
                style: TextStyle(
                  color: this.invert
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontFamily: 'Big Shoulders Display',
                ),
              ),
              onPressed: this.funcao,
            ),
          );
  }
}
