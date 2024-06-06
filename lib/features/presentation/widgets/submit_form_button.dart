import 'package:flutter/material.dart';
import 'package:testovoe/core/styles/fontstyle.dart';
import 'package:testovoe/features/models/card_list_dataconsumer.dart';
import 'package:testovoe/features/models/sliders_data_consumers.modal.dart';
import 'package:testovoe/features/presentation/manager/card_list_dataprovider.dart';
import 'package:testovoe/features/presentation/manager/slider_data_provider.dart';

class SubmitFormButton extends StatelessWidget {
  SubmitFormButton(
      {super.key, required this.callback, required this.isAccepted});
  var callback;
  bool isAccepted;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isAccepted
          ? () async {
              await callback();
            }
          : null,
      child: Container(
        constraints: BoxConstraints(minHeight: 44),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: isAccepted ? Color(0xFFFF8702) : Colors.grey,
        ),
        child: Text(
          'Сохранить',
          style: AppStyles.textStyleNunito.copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
