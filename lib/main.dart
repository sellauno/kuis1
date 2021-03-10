import 'package:flutter/material.dart';
import 'inputHarga.dart';
import 'inputDP.dart';
import 'dropdown.dart';
import 'buttonHitung.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  int _hargaBarang = 0;
  int _dp = 0;
  String _lamaCicilan = "6 bulan";
  int _result = 0;

  final inputHargaController = TextEditingController();
  final inputDPController = TextEditingController();

  List<String> listViewItem = [];

  void _perhitunganCicilan(){
    setState((){
      _hargaBarang = (inputHargaController.text) as int;
      _dp = (inputDPController.text) as int;
      int _lama = 0;

      if (_lamaCicilan == "6 bulan")
        _lama = 6;
      else if (_lamaCicilan == "12 bulan")
        _lama = 12;
      else
        _lama = 24;

      _result = (_hargaBarang - _dp) / _lama as int;
      listViewItem.add("Angsuran per bulan : $_result");
    });
  }

  Riwayat({List<String> listViewItem}) {
  listViewItem.map((String value) {
    return Container(
      margin: EdgeInsets.all(10),
       child: Text(
        value,
        style: TextStyle(fontSize: 15),
      )
    );
   }).toList();
  }

  void dropdownOnChanged(String changeValue){
    setState(() {
    _lamaCicilan = changeValue;
    _perhitunganCicilan();
    });
  }

  Widget build(BuildContext context) {

     var listItem = [
      "6 Bulan",
      "12 Bulan",
      "24 Bulan",
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  Scaffold(
      appBar: AppBar(
      title: Text("Kalkulator Cicilan Kredit"),
      ),
       body: Container(
          child: Column(
            children: [
              InputHarga(inputHargaController: inputHargaController),
              InputDP(inputDPController: inputDPController),
              DropdownPilihan(listItem: listItem, newValue: _lamaCicilan, dropdownOnChanged : dropdownOnChanged),
              Result(result: _result),
              ButtonHitung(hitung: _perhitunganCicilan),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: Riwayat(listViewItem: listViewItem),
              ),
            ],
          ),
       ),
      ),
    );
  }
}

