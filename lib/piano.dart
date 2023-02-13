import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'dart:math';

// ignore: must_be_immutable
class PianoDesine extends StatefulWidget {
  String? S;
  PianoDesine(String sound, {super.key}) {
    S = sound;
  }

  @override
  State<PianoDesine> createState() => _PianoDesineState();
}

class _PianoDesineState extends State<PianoDesine> {
  static final fluttermidi = FlutterMidi();

  @override
  void initState() {
    load('assets/${widget.S}.sf2');
    super.initState();
  }

  void load(String asset) async {
    fluttermidi.unmute(); // Optionally Unmute
    //as cash
    ByteData byte = await rootBundle.load(asset);

    fluttermidi.prepare(
        sf2: byte, name: 'assets/${widget.S}.sf2'.replaceAll('assets/', ''));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractivePiano(
        highlightedNotes: [NotePosition(note: Note.C, octave: 3)],
        naturalColor: Colors.white,
        accidentalColor: Colors.black,
        //width button
        keyWidth: 60,
        //add layer sound high , low, mid
        noteRange: NoteRange.forClefs([Clef.Treble, Clef.Alto, Clef.Treble]),
        //package to play file.sf2
        onNotePositionTapped: (position) {
          fluttermidi.playMidiNote(midi: Random().nextInt(100) + 60);
        },
      ),
    );
  }
}
