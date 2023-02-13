import 'package:flutter/material.dart';
import 'package:flutter_application_1/piano.dart';

// ignore: must_be_immutable
class MachinMusic extends StatefulWidget {
  String? image;
  String? sound;
  MachinMusic(String imageMachin, String soundMachin, {super.key}) {
    image = imageMachin;
    sound = soundMachin;
  }

  @override
  State<MachinMusic> createState() => _MachinMusicState();
}

class _MachinMusicState extends State<MachinMusic> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 400,
            height: 300,
            child: Image.asset(
              '${widget.image}',
              fit: BoxFit.fill,
            ),
          ),
          onTap: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PianoDesine(widget.sound!)),
              );
            });
          },
        ),
      ),
    );
  }
}
