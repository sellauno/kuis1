import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputDP extends StatelessWidget {
  const InputDP({
    Key key,
    @required this.inputDPController,
  }) : super(key: key);

  final TextEditingController inputDPController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: "Masukkan Jumlah DP"),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: inputDPController,
      keyboardType: TextInputType.number,
    );
  }
}