import 'package:flutter/material.dart';

import 'package:flutter_application_1/wedgit/machin_music.dart';
import 'package:flutter_application_1/wedgit/menu.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

//desine screen multi machin music
class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'play music',
          style: TextStyle(
              fontFamily: 'DancingScript', color: Colors.black, fontSize: 40),
        ),
        actions: [Menu('Piano')],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MachinMusic('images/chrismandolin.jpg', 'ChrisMandolin'),
            MachinMusic('images/Piano.jpg', 'Piano'),
            MachinMusic('images/drumkit.png', 'Drumkit'),
            MachinMusic('images/kbhrealchoir.gif', 'KBHRealChoir'),
          ],
        ),
      ),
    );
  }
}
