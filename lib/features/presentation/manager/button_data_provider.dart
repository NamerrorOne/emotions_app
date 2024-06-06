import 'package:flutter/material.dart';
import 'package:testovoe/features/models/button_data_consumer.modal.dart';

class ButtonDataProvider extends InheritedNotifier<ButtonDataConsumer> {
  final ButtonDataConsumer model;

  const ButtonDataProvider(
      {super.key, required this.model, required Widget child})
      : super(child: child, notifier: model);
}
