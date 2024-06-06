import 'package:flutter/material.dart';
import 'package:testovoe/core/styles/fontstyle.dart';

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
        constraints: const BoxConstraints(minHeight: 44),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: isAccepted ? const Color(0xFFFF8702) : Colors.grey,
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
