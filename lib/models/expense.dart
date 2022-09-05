import 'package:intl/intl.dart';

class Expense {
  final DateTime dateTime;
  final double value;
  final String name;
  const Expense({
    required this.dateTime,
    required this.name,
    required this.value,
  });

  String getDateTime(String format) {
    var formater = DateFormat(format);
    return formater.format(dateTime);
  }

  String getDollar() {
    return '\$${value.round()}';
  }
}
