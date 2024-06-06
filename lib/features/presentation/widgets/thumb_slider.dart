import 'package:flutter/material.dart';
import 'package:testovoe/core/styles/fontstyle.dart';
import 'package:testovoe/features/models/card_list_dataconsumer.dart';
import 'package:testovoe/features/models/sliders_data_consumers.modal.dart';
import 'package:testovoe/features/presentation/manager/card_list_dataprovider.dart';
import 'package:testovoe/features/presentation/manager/slider_data_provider.dart';

class ThumbSlider extends StatelessWidget {
  ThumbSlider(
      {super.key,
      required this.startTitle,
      required this.endTitle,
      required this.sliderId});

  String startTitle;
  String endTitle;
  final sliderId;

  final activeTrackColor = const Color(0xFFFF8702);
  final inactiveTrackColor = const Color(0xFFE1DDD8);

  @override
  Widget build(BuildContext context) {
    final cardModel = context
        .dependOnInheritedWidgetOfExactType<CardsListDataProvider>()
        ?.cardsListModel;

    final isActive = cardModel!.tabTriggered;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              return Container(
                width: 2,
                height: 8,
                decoration: BoxDecoration(
                  color: inactiveTrackColor,
                ),
              );
            }),
          ),
        ),
        SliderTheme(
          data: SliderThemeData(
            overlayColor: Colors.white,
            activeTrackColor: activeTrackColor,
            trackHeight: 8,
            inactiveTrackColor: inactiveTrackColor,
            thumbColor: activeTrackColor,
            activeTickMarkColor: Colors.transparent,
            inactiveTickMarkColor: Colors.transparent,
            disabledActiveTickMarkColor: Colors.transparent,
          ),
          child: Slider(
            divisions: 5,
            min: 0,
            max: 100,
            value: sliderId == 1
                ? context
                    .dependOnInheritedWidgetOfExactType<SlidersDataProvider>()
                    ?.slidersModel
                    .firstSliderValue
                : context
                    .dependOnInheritedWidgetOfExactType<SlidersDataProvider>()
                    ?.slidersModel
                    .secondSliderValue,
            onChanged: isActive
                ? (double value) {
                    var slisersModel = context
                        .dependOnInheritedWidgetOfExactType<
                            SlidersDataProvider>()
                        ?.slidersModel;

                    sliderId == 1
                        ? slisersModel?.setFirstSliderValue(value)
                        : slisersModel?.setSecondSliderValue(value);

                    //models
                    final CardsListDataConsumer? cardsModel = context
                        .dependOnInheritedWidgetOfExactType<
                            CardsListDataProvider>()
                        ?.cardsListModel;
                    final SlidersDataConsumer? slidersModel = context
                        .dependOnInheritedWidgetOfExactType<
                            SlidersDataProvider>()
                        ?.slidersModel;

                    if (slidersModel?.controllerText != '' &&
                        slidersModel?.firstSliderValue != 0 &&
                        slidersModel?.secondSliderValue != 0 &&
                        cardsModel?.pickedChip != '') {
                      cardsModel?.makeButtonAcceptableToConfirm();
                    } else {
                      cardsModel?.makeButtonNoAcceptableToConfirm();
                    }
                  }
                : null,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                startTitle,
                style: AppStyles.textStyleNunito
                    .copyWith(color: Color(0xFF919EAB)),
              ),
              Text(
                endTitle,
                style: AppStyles.textStyleNunito
                    .copyWith(color: Color(0xFF919EAB)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
