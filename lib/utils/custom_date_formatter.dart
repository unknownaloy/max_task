import 'package:intl/intl.dart';

class CustomDateFormatter {
  final _monthDayYearFormatter = DateFormat("MMMM d, y");

  /// Method formats a DateTime object into "Month day, year"
  /// e.g. => January 1, 2049
  String weekdayMonthDayFormatter(DateTime dateTime) {
    String result = _monthDayYearFormatter.format(dateTime);

    return result;
  }
}
