import 'package:flutter/widgets.dart';

class CardsListDataConsumer extends ChangeNotifier {
  int? activeCardId;
  bool tabsInit = false;
  int? activitedTabs;

  bool tabTriggered = false;
  List cardTabs = [];
  String pickedChip = '';
  bool acceptedToConfirm = false;

  setActiveCardId(int id) {
    this.activeCardId = id;
    notifyListeners();
  }

  tabTrigger(int id) {
    print(id);
    print(tabs[id]);
    if (id >= 0 && id < tabs.length) {
      this.tabTriggered = true;
      this.cardTabs = tabs[id - 1];
    }
    notifyListeners();
  }

  pickChip(String value) {
    this.pickedChip = value;
    notifyListeners();
  }

  makeButtonAcceptableToConfirm() {
    this.acceptedToConfirm = true;
    notifyListeners();
  }

  makeButtonNoAcceptableToConfirm() {
    this.acceptedToConfirm = false;
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
  'Психушка',
  'что то еще',
];
List tabs4 = [
  'Восторг',
  'Хорошее настроение',
  'Страх',
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
