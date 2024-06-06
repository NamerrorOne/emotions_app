import 'package:flutter/material.dart';
import 'package:testovoe/features/models/card_list_dataconsumer.dart';

class CardsListDataProvider extends InheritedNotifier<CardsListDataConsumer> {
  final CardsListDataConsumer cardsListModel;

  const CardsListDataProvider({super.key, required Widget child, required this.cardsListModel})
      : super(
          child: child,
          notifier: cardsListModel,
        );
}
