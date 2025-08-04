import 'dart:ui';
import 'package:flutter/material.dart';

class WindDetailPage extends StatelessWidget {
  final String value;

  const WindDetailPage({required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Wind Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/wind.jpeg',
            fit: BoxFit.cover,
            height: media.height,
            width: media.width,
          ),

          // Overlay
          Container(
            height: media.height,
            width: media.width,
            color: Colors.black.withOpacity(0.5),
          ),

          // Content
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
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white38),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.air, size: 80, color: Colors.cyanAccent),
                        const SizedBox(height: 16),
                        Text(
                          '$value km/h',
                          style: const TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(color: Colors.black54, offset: Offset(2, 2), blurRadius: 4),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Current Wind Speed',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Wind speed affects how the weather feels. '
                          'Strong winds can increase the chill factor or spread weather systems quickly.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
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
