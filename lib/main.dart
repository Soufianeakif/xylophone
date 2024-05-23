import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Xylophone()),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void playSound(int noteNumber) async {
    try {
      await _audioPlayer.play(AssetSource('note$noteNumber.wav'));
    } catch (e) {
      print('Error playing sound: $e');
    }
  }

  Expanded buildKey({required int soundNumber, required Color colorSound}) {
    return Expanded(
      child: Container(
        color: colorSound,
        child: TextButton(
          style: const ButtonStyle(enableFeedback: false),
          onPressed: () => playSound(soundNumber),
          child: const Text(''),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(soundNumber: 1, colorSound: Colors.red),
            buildKey(soundNumber: 2, colorSound: Colors.orange),
            buildKey(soundNumber: 3, colorSound: Colors.yellow),
            buildKey(soundNumber: 4, colorSound: Colors.green),
            buildKey(soundNumber: 5, colorSound: Colors.teal),
            buildKey(soundNumber: 6, colorSound: Colors.blue),
            buildKey(soundNumber: 7, colorSound: Colors.purple),
          ],
        ),
      ),
    );
  }
}
