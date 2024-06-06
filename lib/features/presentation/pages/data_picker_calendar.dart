import 'package:flutter/material.dart';
import 'package:testovoe/core/styles/fontstyle.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime.now();
  int _currentMonth = DateTime.now().month;
  int _currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        _buildHeader(),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: _buildWeekDays(),
        ),
        SizedBox(height: 20),
        _buildMonths(),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: Color(0xFFBCBCBF)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            'Сегодня',
            style: AppStyles.textStyleNunito.copyWith(
                color: Color(0xFFBCBCBF),
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        )
      ],
    );
  }

  Widget _buildWeekDays() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _weekDays.map((day) {
        return Text(
          day,
          style: AppStyles.textStyleNunito.copyWith(
            color: Color(0xFFBCBCBF),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMonths() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index > 0) SizedBox(height: 20),
                Text(
                  '$_currentYear',
                  style: AppStyles.textStyleNunito.copyWith(
                    color: Color(0xFFBCBCBF),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  _monthNames[index],
                  style: AppStyles.textStyleNunito.copyWith(
                    color: Color(0xFF4C4C69),
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 20),
                _buildDaysForMonth(index + 1, _currentYear),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDaysForMonth(int month, int year) {
    final firstDayOfMonth = DateTime(year, month, 1);
    final daysInMonth = _daysInMonth(year, month);
    final weekday = firstDayOfMonth.weekday;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
      ),
      itemCount: daysInMonth + weekday - 1,
      itemBuilder: (context, index) {
        if (index < weekday - 1) {
          return SizedBox.shrink();
        } else {
          final day = index - weekday + 2;
          final isToday = day == _currentDate.day &&
              month == _currentDate.month &&
              year == _currentDate.year;
          return CalendarDay(
            day: day,
            isToday: isToday,
          );
        }
      },
    );
  }

  int _daysInMonth(int year, int month) {
    final List<int> daysInMonth = [
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    if (month == DateTime.february && _isLeapYear(year)) {
      return 29;
    } else {
      return daysInMonth[month - 1];
    }
  }

  bool _isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  static const List<String> _monthNames = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];

  static const List<String> _weekDays = [
    'ПН',
    'ВТ',
    'СР',
    'ЧТ',
    'ПТ',
    'СБ',
    'ВС'
  ];
}

class CalendarDay extends StatelessWidget {
  final int day;
  final bool isToday;

  const CalendarDay({
    super.key,
    required this.day,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isToday
          ? BoxDecoration(
              color: Colors.orange[300],
              shape: BoxShape.circle,
            )
          : null,
      child: Center(
        child: Text(
          '$day',
          style: AppStyles.textStyleNunito.copyWith(
            color: isToday ? Colors.white : Color(0xFF4C4C69),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
