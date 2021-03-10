import 'package:flutter/material.dart';

class ButtonHitung extends StatelessWidget {
  final Function hitung;

  ButtonHitung({Key key, @required this.hitung});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment : Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            onPressed: hitung,
            color: Colors.blueAccent,
            textColor: Colors.white,
            child: Text("Hitung"),
          ),
        ),
      ),
    );
  }
}