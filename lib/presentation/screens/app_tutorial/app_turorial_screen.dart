import 'package:animate_do/animate_do.dart';
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

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageViewController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!isLastPage && page >= (slides.length - 1.5)) {
        setState(() {
          isLastPage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
          controller: pageViewController,
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
        ),
        isLastPage
            ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from: 15,
                  duration: const Duration(seconds: 1),
                  child: FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Comenzar'),
                  ),
                ),
              )
            : const SizedBox(),
      ]),
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
