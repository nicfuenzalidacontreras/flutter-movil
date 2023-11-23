import 'package:flutter/material.dart';

class SlidesInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlidesInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlidesInfo>[
  SlidesInfo('Busca la comida', 'Lorem est et veniam est aliquip cupidatat.',
      'assets/images/1.png'),
  SlidesInfo('Entrega rápida', 'Tempor mollit exercitation qui sunt.',
      'assets/images/2.png'),
  SlidesInfo(
      'Disfruta la comida',
      'Non labore consectetur eiusmod nulla est incididunt irure occaecat Lorem proident minim mollit dolor mollit.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: slides
            .map((slide) => _Slide(
                title: slide.title,
                caption: slide.caption,
                imageUrl: slide.imageUrl))
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
