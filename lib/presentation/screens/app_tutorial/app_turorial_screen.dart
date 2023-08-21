import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String description;
  final String imagePath;

  const SlideInfo(
    this.title,
    this.description,
    this.imagePath,
  );
}

final slides = <SlideInfo>[
  const SlideInfo(
    'Welcome to the App',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'assets/images/1.png',
  ),
  const SlideInfo(
    'Welcome to the App',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'assets/images/2.png',
  ),
  const SlideInfo(
    'Welcome to the App',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: slides
            .map((e) => _Slide(
                title: e.title,
                description: e.description,
                imagePath: e.imagePath))
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const _Slide(
      {required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
