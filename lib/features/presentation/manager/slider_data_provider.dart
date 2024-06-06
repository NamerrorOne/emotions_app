import 'package:flutter/material.dart';
import 'package:testovoe/features/models/sliders_data_consumers.modal.dart';

class SlidersDataProvider extends InheritedNotifier<SlidersDataConsumer> {
  final SlidersDataConsumer slidersModel;

  const SlidersDataProvider(
      {super.key, required this.slidersModel, required Widget child})
      : super(child: child, notifier: slidersModel);
}
