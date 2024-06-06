import 'package:flutter/material.dart';

class SlidersDataConsumer extends ChangeNotifier {
  double? _firstSliderValue = 0;
  double? _secondSliderValue = 0;
  String controllerText = '';

  get firstSliderValue => _firstSliderValue;
  get secondSliderValue => _secondSliderValue;

  setFirstSliderValue(double value) {
    this._firstSliderValue = value;
    notifyListeners();
  }

  setSecondSliderValue(double value) {
    this._secondSliderValue = value;
    notifyListeners();
  }

  setControllerText(String value) {
    this.controllerText = value;
    notifyListeners();
  }
}
