import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const Alignment(2, -0.6),
          child: Container(
            width: 350,
            height: 350,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Align(
          alignment: const Alignment(-1, -0.3),
          child: Container(
            width: 350,
            height: 350,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 80,
            sigmaY: 80,
          ),
          child: Container(
            color: Colors.transparent,
          ),
        )
      ],
    );
  }
}
