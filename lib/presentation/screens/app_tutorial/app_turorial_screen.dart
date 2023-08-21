import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((e) => _Slide(
                    title: e.title,
                    description: e.description,
                    imagePath: e.imagePath))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Skip'),
            ),
          )
        ],
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
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final descriptionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imagePath)),
          const SizedBox(height: 20),
          Text(title, style: titleStyle),
          const SizedBox(height: 10),
          Text(description, style: descriptionStyle),
        ],
      ),
    );
  }
}
