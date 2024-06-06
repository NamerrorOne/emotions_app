import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testovoe/core/styles/fontstyle.dart';
import 'package:testovoe/features/presentation/manager/button_data_provider.dart';

class SwitchButtonBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? buttonMode = context
        .dependOnInheritedWidgetOfExactType<ButtonDataProvider>()
        ?.model
        .buttonMode;

    if (buttonMode == 'main') {
      return Stack(
        children: <Widget>[
          Container(
            height: 30,
            decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(47)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: GestureDetector(
                onTap: () {
                  context
                      .dependOnInheritedWidgetOfExactType<ButtonDataProvider>()
                      ?.model
                      .changeButtonMode();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SvgPicture.asset(
                        '/Users/igorabramov/Desktop/testovoe/testovoe/assets/icons/statistic.svg'),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Статистика",
                      style: AppStyles.textStyleNunito.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFBCBCBF),
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFF8702),
                    borderRadius: BorderRadius.circular(47)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/book-icon.svg'),
                        const SizedBox(
                          width: 6,
                        ),
                        Text("Дневник настроения",
                            style: AppStyles.textStyleNunito.copyWith(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      );
    } else if (buttonMode == 'secondary') {
      return Stack(
        children: <Widget>[
          Container(
            height: 30,
            decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(47)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: GestureDetector(
                onTap: () {
                  context
                      .dependOnInheritedWidgetOfExactType<ButtonDataProvider>()
                      ?.model
                      .changeButtonMode();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/book-icon.svg'),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Дневник настроения",
                      style: AppStyles.textStyleNunito.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFBCBCBF),
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFF8702),
                    borderRadius: BorderRadius.circular(47)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                            color: Colors.white,
                            '/Users/igorabramov/Desktop/testovoe/testovoe/assets/icons/statistic.svg'),
                        const SizedBox(
                          width: 6,
                        ),
                        Text("Статистика",
                            style: AppStyles.textStyleNunito.copyWith(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      );
    } else {
      return Center(
        child: Text(
          "Ошибка при загрузке кнопки",
        ),
      );
    }
  }
}
