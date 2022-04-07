import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruta_artesanal/main.dart';

class Playerwidget extends StatefulWidget {
  const Playerwidget({Key? key}) : super(key: key);

  @override
  State<Playerwidget> createState() => _PlayerwidgetState();
}

class _PlayerwidgetState extends State<Playerwidget> {
  final TextStyle _textStyle = const TextStyle(color: Colors.red, fontSize: 20);
  bool isplaying = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              iconSize: 150,
                onPressed: () {
                  setState(() {
                    isplaying = !isplaying;
                  });
                },
                icon: isplaying 
                 ? const Icon(Icons.pause) 
                 : const Icon(Icons.play_arrow)),
            Text(
              isplaying 
              ? 'pause the song'
              : 'press to play song',
              style: _textStyle,
            )
          ]),
    );
  }
}
