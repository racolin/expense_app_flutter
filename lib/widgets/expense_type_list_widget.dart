import 'package:flutter/material.dart';
import 'package:section_2/models/expense_type.dart';
import 'expense_type_widget.dart';
import 'dart:math';

class ExpenseTypeListWidget extends StatelessWidget {
  final List<ExpenseType> typeList;

  const ExpenseTypeListWidget({
    Key? key,
    required this.typeList,
  }) : super(key: key);

  double getMaxValue(List<ExpenseType> list) {
    var m = 0.0;
    for (var e in list) {
      m = max(m, e.total);
    }
    String s = m.toInt().toString();
    int len = s.length;
    int first = int.parse(s.substring(0, 1));
    return (first + 1) * pow(10, len - 1).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    var widget;
    var widgets = typeList
        .map((e) => ExpenseTypeWidget(
              type: e,
              total: getMaxValue(typeList),
            ))
        .toList();
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      widget = Card(
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgets,
          ),
        ),
      );
    } else {
      widget = Card(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widgets,
          ),
        ),
      );
    }
    return widget;
  }
}
