
class NowDateConsumer {
  final int day;
  final String month;
  final String time;

  NowDateConsumer({required this.day, required this.month, required this.time});

  factory NowDateConsumer.getDate() {
    final now = DateTime.now();
    final monthName = _getMonthName(now.month);
    final timeString = '${now.hour}:${now.minute.toString().padLeft(2, '0')}';

    return NowDateConsumer(
      day: now.day,
      month: monthName,
      time: timeString,
    );
  }

  static String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'января';
      case 2:
        return 'февраля';
      case 3:
        return 'марта';
      case 4:
        return 'апреля';
      case 5:
        return 'мая';
      case 6:
        return 'июня';
      case 7:
        return 'июля';
      case 8:
        return 'августа';
      case 9:
        return 'сентября';
      case 10:
        return 'октября';
      case 11:
        return 'ноября';
      case 12:
        return 'декабря';
      default:
        return '';
    }
  }
}
