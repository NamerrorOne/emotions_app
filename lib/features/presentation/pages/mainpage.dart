import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testovoe/core/helpers/get_data.dart';
import 'package:testovoe/core/styles/fontstyle.dart';
import 'package:testovoe/features/local_storage/localstorage.dart';
import 'package:testovoe/features/models/card_list_dataconsumer.dart';
import 'package:testovoe/features/models/sliders_data_consumers.modal.dart';
import 'package:testovoe/features/presentation/manager/button_data_provider.dart';
import 'package:testovoe/features/presentation/manager/card_list_dataprovider.dart';
import 'package:testovoe/features/presentation/manager/slider_data_provider.dart';
import 'package:testovoe/features/presentation/pages/data_picker_calendar.dart';
import 'package:testovoe/features/presentation/widgets/date_ui.dart';
import 'package:testovoe/features/presentation/widgets/emotions_list.dart';
import 'package:testovoe/features/presentation/widgets/submit_form_button.dart';
import 'package:testovoe/features/presentation/widgets/switch_button_bar.widget.dart';
import 'package:testovoe/features/models/button_data_consumer.modal.dart';
import 'package:testovoe/features/presentation/widgets/tabs_under_emotions.dart';
import 'package:testovoe/features/presentation/widgets/textdield.dart';
import 'package:testovoe/features/presentation/widgets/thumb_slider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final model = ButtonDataConsumer();
  final slidersModel = SlidersDataConsumer();
  final cardsListModel = CardsListDataConsumer();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          backgroundColor: const Color(0xFFFFFDFC),
          appBar: AppBar(
            surfaceTintColor: const Color(0xFFFFFDFC),
            shadowColor: Colors.black,
            backgroundColor: const Color(0xFFFFFDFC),
            title: DateText(),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => Calendar(),
                    );
                  },
                  icon: SvgPicture.asset('assets/icons/calendar-icon.svg'),
                ),
              ),
            ],
          ),
          body: ButtonDataProvider(
            model: model,
            child: SingleChildScrollView(
                child: CardsListDataProvider(
              cardsListModel: cardsListModel,
              child: BuildBody(
                  slidersModel: slidersModel, cardsListModel: cardsListModel),
            )),
          )),
    );
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
    required this.slidersModel,
    required this.cardsListModel,
  });

  final SlidersDataConsumer slidersModel;
  final CardsListDataConsumer cardsListModel;

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 44),
          child: SwitchButtonBarWidget(),
        ),
        const SizedBox(
          height: 30,
        ),
        context
                    .dependOnInheritedWidgetOfExactType<ButtonDataProvider>()
                    ?.model
                    .buttonMode ==
                'main'
            ? SlidersDataProvider(
                slidersModel: slidersModel,
                child: _BuildMainBody(
                  slidersModel: slidersModel,
                  cardsListModel: cardsListModel,
                ))
            : _BuildSecondaryBody()
      ],
    );
  }
}

class _BuldEmotionList extends StatelessWidget {
  const _BuldEmotionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const EmotionsList();
  }
}

class _BuildMainBody extends StatelessWidget {
  _BuildMainBody(
      {super.key, required this.slidersModel, required this.cardsListModel});

  SlidersDataConsumer slidersModel;
  CardsListDataConsumer cardsListModel;

  Future<void> saveData() async {
    var directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/demo_localfile.txt');
    final _nowDate = NowDateConsumer.getDate();

    final currentDay = '${_nowDate!.day} ${_nowDate!.month} ${_nowDate!.time}';
    final stressValue = slidersModel.firstSliderValue.toString();
    final selfish = slidersModel.secondSliderValue.toString();
    final notes = slidersModel.controllerText.toString();
    final tabsValue = cardsListModel.pickedChip;

    file.writeAsString(
        'Дата: ${currentDay}\nЧто чувствуешь? ${tabsValue}\nУровень стресса: ${stressValue}%\nСамооценка: ${selfish}%\nЗаметки: ${notes}');
  }

  @override
  Widget build(BuildContext context) {
    void _showPopup() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Успех',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              'Ваши данные успешно сохранены в локальное хранилище',
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Закрыть',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        },
      );
    }

//models
    final CardsListDataConsumer? cardsModel = context
        .dependOnInheritedWidgetOfExactType<CardsListDataProvider>()
        ?.cardsListModel;
    final SlidersDataConsumer? slidersModel = context
        .dependOnInheritedWidgetOfExactType<SlidersDataProvider>()
        ?.slidersModel;

    bool isAccepted = cardsModel!.acceptedToConfirm;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: Text(
            'Что чувствуешь?',
            style: AppStyles.textStyleNunito
                .copyWith(fontWeight: FontWeight.w800, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const _BuldEmotionList(),
        SizedBox(
          height: 20,
        ),
        Tabs(),
        const SizedBox(
          height: 36,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: Text(
            'Уровень стресса',
            style: AppStyles.textStyleNunito
                .copyWith(fontWeight: FontWeight.w800, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ThumbSlider(
          sliderId: 1,
          startTitle: 'Низкий',
          endTitle: 'Высокий',
        ),
        const SizedBox(
          height: 52,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: Text(
            'Самооценка',
            style: AppStyles.textStyleNunito
                .copyWith(fontWeight: FontWeight.w800, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ThumbSlider(
          sliderId: 2,
          startTitle: 'Неуверенность',
          endTitle: 'Уверенность',
        ),
        const SizedBox(
          height: 52,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: Text(
            'Заметки',
            style: AppStyles.textStyleNunito
                .copyWith(fontWeight: FontWeight.w800, fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextField(),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SubmitFormButton(
            isAccepted: isAccepted,
            callback: () {
              saveData();
              _showPopup();
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

//на скорую руку
class _BuildSecondaryBody extends StatefulWidget {
  @override
  State<_BuildSecondaryBody> createState() => _BuildSecondaryBodyState();
}

class _BuildSecondaryBodyState extends State<_BuildSecondaryBody> {
  String? localStorageData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
                onPressed: () async {
                  var directory = await getApplicationDocumentsDirectory();
                  final file = File('${directory.path}/demo_localfile.txt');

                  if (await file.exists()) {
                    localStorageData = await file.readAsString();
                    setState(() {});
                  } else {
                    localStorageData = 'No data found';
                    setState(() {});
                  }
                },
                child: Text("Нажмите, чтобы отобразить данные")),
            Text(localStorageData ?? '')
          ]),
    );
  }
}
