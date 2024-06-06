import 'package:flutter/material.dart';
import 'package:testovoe/features/models/sliders_data_consumers.modal.dart';

class SlidersDataProvider extends InheritedNotifier<SlidersDataConsumer> {
  SlidersDataConsumer slidersModel;

  SlidersDataProvider({required this.slidersModel, required Widget child})
      : super(child: child, notifier: slidersModel);
}
