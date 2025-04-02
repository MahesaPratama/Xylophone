import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final List noteNada = [
    {
      'nada': 'assets/note1.wav',
      'label': '1',
      'warna': Colors.orange.shade300,
    },
    {
      'nada': 'assets/note2.wav',
      'label': '2',
      'warna': Colors.orange.shade400,
    },
    {
      'nada': 'assets/note3.wav',
      'label': '3',
      'warna': Colors.orange.shade500,
    },
    {
      'nada': 'assets/note4.wav',
      'label': '4',
      'warna': Colors.orange.shade600,
    },
    {
      'nada': 'assets/note5.wav',
      'label': '5',
      'warna': Colors.orange.shade700,
    },
    {
      'nada': 'assets/note6.wav',
      'label': '6',
      'warna': Colors.orange.shade800,
    },
    {
      'nada': 'assets/note7.wav',
      'label': '7',
      'warna': Colors.orange.shade900,
    },
  ];

  Future<void> playSound(String assetPath) async {
    final player = AudioPlayer();
    await player.setAsset(assetPath);
    player.play();
    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        player.dispose();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Column(
          children:
              noteNada.map((note) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () => playSound(note['nada']),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 1.h,
                      ),
                      decoration: BoxDecoration(
                        color: note['warna'],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white60, width: 1.5),
                      ),
                      child: Center(
                        child: Text(
                          note['label'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}