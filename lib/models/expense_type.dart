import 'package:intl/intl.dart';

class ExpenseType {
  final int dayOfWeek;
  late double _total;
  ExpenseType({required this.dayOfWeek, required double total}) {
    _total = total;
  }

  double get total => _total;
  set total(double value) {
    if (value > 0) {
      _total = value;
    }
  }

  String getTotalDollar() {
    return '\$${_total.round()}';
  }

  String getDayOfWeekString() {
    var formatter = DateFormat('E');
    var date = DateTime.now();
    date = date.subtract(Duration(days: date.weekday));
    date = date.add(Duration(days: dayOfWeek));
    return formatter.format(date);
  }
}
