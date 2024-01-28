import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(10);

  void changeShape() {
    setState(() {
      final random = Random();
      width = random.nextInt(300).toDouble();
      height = random.nextInt(300).toDouble();
      color = Color(random.nextInt(0xffffffff + 1));
      borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeOutCubic,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
