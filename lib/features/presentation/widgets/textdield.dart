import 'package:flutter/material.dart';
import 'package:testovoe/features/models/card_list_dataconsumer.dart';
import 'package:testovoe/features/models/sliders_data_consumers.modal.dart';
import 'package:testovoe/features/presentation/manager/card_list_dataprovider.dart';
import 'package:testovoe/features/presentation/manager/slider_data_provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context
            .dependOnInheritedWidgetOfExactType<SlidersDataProvider>()
            ?.slidersModel
            .controllerText = value;

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
      decoration: InputDecoration(
        hintText: 'Введите текст',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: const Color(0xFFB6A1C0).withOpacity(0.11),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: const Color(0xFFB6A1C0).withOpacity(0.11),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: const Color(0xFFB6A1C0).withOpacity(0.11),
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 16,
          bottom: 60,
          top: 11,
          right: 16,
        ),
      ),
      maxLines: 3,
    );
  }
}
