import 'dart:ui';
import 'package:flutter/material.dart';

class RainDetailPage extends StatelessWidget {
  final String value;

  const RainDetailPage({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Detail Hujan'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/rainbg.jpeg',
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
                      border: Border.all(color: Colors.white38),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.grain,
                          size: 80,
                          color: Colors.lightBlueAccent,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '$value%',
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                          'Kemungkinan Hujan',
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
                          'Persentase yang lebih tinggi berarti kemungkinan terjadinya hujan lebih besar.'
                          'Jika di atas 50%, Anda mungkin perlu membawa payung!',
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
