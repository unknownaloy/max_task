import 'package:intl/intl.dart';

class CustomDateFormatter {
  final _monthDayYearFormatter = DateFormat("MMMM d, y");

  String weekdayMonthDayFormatter(DateTime dateTime) {
    String result = _monthDayYearFormatter.format(dateTime);

    return result;
  }
}
