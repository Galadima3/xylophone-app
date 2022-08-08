// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  Future setAudio(int soundNumber) async {
    audioPlayer.open(Audio('assets/note$soundNumber.wav'));
    audioPlayer.play();
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: MaterialButton(
        color: color,
        onPressed: () {
          setAudio(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(color: Colors.red, soundNumber: 1),
          buildKey(color: Colors.orange, soundNumber: 2),
          buildKey(color: Colors.yellow, soundNumber: 3),
          buildKey(color: Colors.green, soundNumber: 4),
          buildKey(color: Colors.blue, soundNumber: 5),
          buildKey(color: Colors.indigo, soundNumber: 6),
          buildKey(color: Colors.teal, soundNumber: 7),
        ],
      ),
    );
  }
}
