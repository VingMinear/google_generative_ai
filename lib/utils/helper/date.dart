import 'package:intl/intl.dart';

class Date {
  static DateTime date = DateTime.now();
  static String dayOfWeek = DateFormat.E().format(date);
  static String day = DateFormat.d().format(date);
  static String month = DateFormat.MMM().format(date);
  static String fullmonth = DateFormat.MMMM().format(date);

  static String year = DateFormat.y().format(date);
}
