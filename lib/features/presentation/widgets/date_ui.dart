import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testovoe/core/helpers/get_data.dart';
import 'package:testovoe/core/styles/fontstyle.dart';

class DateText extends StatefulWidget {
  const DateText({super.key});

  @override
  State<DateText> createState() => _DateTextState();
}

class _DateTextState extends State<DateText> {
  NowDateConsumer? _nowDate;
  Timer? _timer;

  @override
  void initState() {
    _nowDate = NowDateConsumer.getDate();
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _nowDate = NowDateConsumer.getDate();
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _nowDate != null
          ? '${_nowDate!.day} ${_nowDate!.month} ${_nowDate!.time}'
          : '',
      style: AppStyles.textStyleNunito.copyWith(
        fontSize: 18,
        color: const Color(0xFFBCBCBF),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
