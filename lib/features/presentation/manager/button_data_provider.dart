import 'package:flutter/material.dart';
import 'package:testovoe/features/models/button_data_consumer.modal.dart';

class ButtonDataProvider extends InheritedNotifier<ButtonDataConsumer> {
  ButtonDataConsumer model;

  ButtonDataProvider({required this.model, required Widget child})
      : super(child: child, notifier: model);
}
