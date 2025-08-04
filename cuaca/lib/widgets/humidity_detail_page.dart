import 'dart:ui';
import 'package:flutter/material.dart';

class HumidityDetailPage extends StatelessWidget {
  final String value;

  const HumidityDetailPage({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Detail Kelembaban'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/humidity.jpeg',
            fit: BoxFit.cover,
            height: media.height,
            width: media.width,
          ),

          Container(
            height: media.height,
            width: media.width,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white.withOpacity(0.3)
                : Colors.black.withOpacity(0.3),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white38, width: 1.2),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.water_drop,
                          size: 80,
                          color: Colors.cyanAccent,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '$value%',
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                            shadows: [
                              Shadow(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white54
                                    : Colors.black54,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Kelembaban Relatif',
                          style: TextStyle(
                            fontSize: 22,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Kelembapan menunjukkan jumlah uap air di udara.'
                          'Kelembapan yang tinggi dapat membuat suhu terasa lebih hangat dan memengaruhi tingkat kenyamanan.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
