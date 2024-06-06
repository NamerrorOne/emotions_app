import 'package:flutter/material.dart';
import 'package:testovoe/core/styles/fontstyle.dart';
import 'package:testovoe/features/entities/emotion_card_entity.dart';
import 'package:testovoe/features/presentation/manager/card_list_dataprovider.dart';

class EmotionCard extends StatelessWidget {
  const EmotionCard({super.key, required this.cardEntity});

  final EmotionCardEntity cardEntity;

  @override
  Widget build(BuildContext context) {
    final model = context
        .dependOnInheritedWidgetOfExactType<CardsListDataProvider>()
        ?.cardsListModel;

    return GestureDetector(
      onTap: () {
        model?.setActiveCardId(cardEntity.id);
        model?.tabTrigger(cardEntity.id);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFB6A1C0).withOpacity(0.11),
              offset: const Offset(2, 4),
              blurRadius: 10.8,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(78),
          border: cardEntity.id ==
                  context
                      .dependOnInheritedWidgetOfExactType<
                          CardsListDataProvider>()
                      ?.cardsListModel
                      .activeCardId
              ? Border.all(color: const Color(0xFFFF8702), width: 2)
              : null,
          color: Colors.white,
        ),
        constraints: const BoxConstraints(maxHeight: 118),
        width: 83,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(cardEntity.urlPath),
            Text(
              cardEntity.title ?? 'title',
              style: AppStyles.textStyleNunito
                  .copyWith(color: const Color(0xFF4C4C69), fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
