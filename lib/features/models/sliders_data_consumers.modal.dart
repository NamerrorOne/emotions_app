import 'package:flutter/material.dart';

class SlidersDataConsumer extends ChangeNotifier {
  double? _firstSliderValue = 0;
  double? _secondSliderValue = 0;
  String controllerText = '';

  get firstSliderValue => _firstSliderValue;
  get secondSliderValue => _secondSliderValue;

  setFirstSliderValue(double value) {
    _firstSliderValue = value;
    notifyListeners();
  }

  setSecondSliderValue(double value) {
    _secondSliderValue = value;
    notifyListeners();
  }

  setControllerText(String value) {
    controllerText = value;
    notifyListeners();
  }
}
