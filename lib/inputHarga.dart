import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputHarga extends StatelessWidget {
  const InputHarga({
    Key key,
    @required this.inputHargaController,
  }) : super(key: key);

  final TextEditingController inputHargaController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: "Masukkan Harga Barang"),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: inputHargaController,
      keyboardType: TextInputType.number,
    );
  }
}