import 'package:flutter/material.dart';
import 'package:flutter_application_1/piano.dart';

String? s;

class Menu extends StatefulWidget {
  Menu(String sound, {super.key}) {
    s = sound;
  }

  @override
  State<Menu> createState() => _MenuState();
}

// ignore: camel_case_types
class _MenuState extends State<Menu> {
  var des = PianoDesine(s!);
  String dropdownValue = s!;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PianoDesine(s!)),
          );
          //
        });
      },
      items: ['ChrisMandolin', 'Piano', 'Drumkit', 'KBHRealChoir']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
