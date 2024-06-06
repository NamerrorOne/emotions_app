import 'package:flutter/material.dart';

class ButtonDataConsumer extends ChangeNotifier {
  String buttonMode = 'main';

  void changeButtonMode() {
    if (buttonMode == 'main') {
      buttonMode = 'secondary';
    } else if (buttonMode == 'secondary') {
      buttonMode = 'main';
    } else {
      buttonMode = 'main';
      return;
    }
    notifyListeners();
  }
}
