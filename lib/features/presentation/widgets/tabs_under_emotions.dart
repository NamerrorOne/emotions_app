import 'package:flutter/material.dart';
import 'package:testovoe/core/styles/fontstyle.dart';
import 'package:testovoe/features/models/card_list_dataconsumer.dart';
import 'package:testovoe/features/models/sliders_data_consumers.modal.dart';
import 'package:testovoe/features/presentation/manager/card_list_dataprovider.dart';
import 'package:testovoe/features/presentation/manager/slider_data_provider.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context
        .dependOnInheritedWidgetOfExactType<CardsListDataProvider>()
        ?.cardsListModel;

    final tabsArray = model?.cardTabs;

    print('tabsArray');

    print(tabsArray);

    return Container(
        child: model?.activeCardId == null
            ? SizedBox()
            : Wrap(
                spacing: 8,
                children: List.generate(tabsArray!.length - 1, (int index) {
                  final text = tabsArray?[index + 1];
                  return CustomChip(labelText: text);
                }),
              ));
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip({super.key, required this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    bool isPicked = false;
    return GestureDetector(
      onTap: () {
        context
            .dependOnInheritedWidgetOfExactType<CardsListDataProvider>()
            ?.cardsListModel
            .pickChip(labelText);

        //models
        final CardsListDataConsumer? cardsModel = context
            .dependOnInheritedWidgetOfExactType<CardsListDataProvider>()
            ?.cardsListModel;
        final SlidersDataConsumer? slidersModel = context
            .dependOnInheritedWidgetOfExactType<SlidersDataProvider>()
            ?.slidersModel;

        if (slidersModel?.controllerText != '' &&
            slidersModel?.firstSliderValue != 0 &&
            slidersModel?.secondSliderValue != 0 &&
            cardsModel?.pickedChip != '') {
          cardsModel?.makeButtonAcceptableToConfirm();
        } else {
          cardsModel?.makeButtonNoAcceptableToConfirm();
        }
      },
      child: Chip(
        backgroundColor: context
                    .dependOnInheritedWidgetOfExactType<CardsListDataProvider>()
                    ?.cardsListModel
                    .pickedChip ==
                labelText
            ? Colors.orange
            : Colors.white,
        side: BorderSide.none,
        label: Text(
          labelText,
          style: AppStyles.textStyleNunito.copyWith(
              color: context
                          .dependOnInheritedWidgetOfExactType<
                              CardsListDataProvider>()
                          ?.cardsListModel
                          .pickedChip ==
                      labelText
                  ? Colors.white
                  : Color(0xFF4C4C69),
              fontSize: 11),
        ),
      ),
    );
  }
}
