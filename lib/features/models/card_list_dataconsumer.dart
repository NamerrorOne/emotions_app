import 'package:flutter/widgets.dart';

class CardsListDataConsumer extends ChangeNotifier {
  int? activeCardId;

  bool tabTriggered = false;
  List cardTabs = [];
  String pickedChip = '';
  bool acceptedToConfirm = false;

  setActiveCardId(int id) {
    activeCardId = id;
    notifyListeners();
  }

  tabTrigger(int id) {
    print(id);
    print(tabs[id]);
    if (id >= 0 && id < tabs.length) {
      tabTriggered = true;
      cardTabs = tabs[id - 1];
    }
    notifyListeners();
  }

  pickChip(String value) {
    pickedChip = value;
    notifyListeners();
  }

  makeButtonAcceptableToConfirm() {
    acceptedToConfirm = true;
    notifyListeners();
  }

  makeButtonNoAcceptableToConfirm() {
    acceptedToConfirm = false;
    notifyListeners();
  }
}

List tabs1 = [
  'Возбуждение',
  'Восторг',
  'Игривость',
  'Наслаждение',
  'Очарование',
  'Осознанность',
  'Смелость',
  'Удовольсвтие',
  'Чувственность',
  'Энергичность',
  'Экстравагантность',
];

List tabs2 = [
  'Восторг',
  'Хорошее настроение',
  'Страх',
  'Ужас',
  'Отчаяние',
  'Чувственность',
];

List tabs3 = [
  'Злость',
  'Грубость',
  'Бешенство',
  'Ярость',
  'Ожесточение',
  'что то еще',
];
List tabs4 = [
  'Грусть',
  'Плохое настроение',
  'Печаль',
  'Ужас',
  'Отсутствие мотвиации',
  'Сонливость',
  'Отчаяние',
  'Тревожность',
  'Переживание',
  'Боязное состояние',
  'Душевная боль',
  'Ужас',
];
List tabs5 = [
  'Восторг',
  'Хорошее настроение',
  'Страх',
  'Ужас',
];
List tabs6 = [
  'Восторг',
  'Хорошее настроение',
  'Страх',
  'Ужас',
];

List tabs = [tabs1, tabs2, tabs3, tabs4, tabs5, tabs6];
