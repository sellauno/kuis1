import 'package:flutter/material.dart';

class DropdownPilihan extends StatelessWidget {
  const DropdownPilihan({
    Key key,
    @required this.dropdownOnChanged,
    @required this.newValue,
    @required this.listItem,
  }) : super(key: key);

  final Function dropdownOnChanged;
  final String newValue;
  final List<String> listItem = [];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items:
        listItem.map((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),);
        }).toList(),
      value: newValue,
      onChanged: dropdownOnChanged,
    );
  }
}