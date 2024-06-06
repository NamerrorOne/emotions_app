import 'package:flutter/material.dart';
import 'package:testovoe/features/entities/emotion_card_entity.dart';
import 'package:testovoe/features/presentation/widgets/emotion_card.dart';

class EmotionsList extends StatelessWidget {
  const EmotionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: titles.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            String title;
            String urlPath;

            title = titles[index];
            urlPath = urlsPaths[index];

            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: EmotionCard(
                cardEntity: EmotionCardEntity(
                    id: index + 1, title: title, urlPath: urlPath),
              ),
            );
          }),
    );
  }
}

//моковые данные
List<String> titles = [
  'Радость',
  'Страх',
  'Бешенство',
  'Грусть',
  'Спокойствие',
  'Сила',
];
List<String> urlsPaths = [
  'assets/images/happy-image.png',
  'assets/images/fear-image.png',
  'assets/images/rampage-image.png',
  'assets/images/sad-image.png',
  'assets/images/calm-image.png',
  'assets/images/power-image.png'
];
