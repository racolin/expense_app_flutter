import 'package:flutter/material.dart';
import 'package:section_2/models/expense_type.dart';

class ExpenseTypeWidget extends StatelessWidget {
  final ExpenseType type;
  final double total;

  const ExpenseTypeWidget({
    Key? key,
    required this.type,
    required this.total,
  }) : super(key: key);

  double getPercent(double total) {
    if (total == 0) {
      return 0;
    }
    return type.total / total > 1 ? 1 : type.total / total;
  }

  @override
  Widget build(BuildContext context) {
    var widget;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      widget = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 32,
            child: Text(type.getDayOfWeekString()),
          ),
          const SizedBox(width: 4),
          Stack(alignment: Alignment.topLeft, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.blue)),
              width: 62,
              height: 12,
            ),
            Container(
              margin: const EdgeInsets.only(top: 1, left: 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.amber),
              width: 60 * getPercent(total),
              height: 10,
            )
          ]),
          const SizedBox(width: 4),
          Text(type.getTotalDollar()),
        ],
      );
    } else {
      widget = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(type.getTotalDollar()),
          const SizedBox(height: 4),
          Stack(alignment: Alignment.topCenter, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.blue)),
              width: 12,
              height: 62,
            ),
            Container(
              margin: const EdgeInsets.only(top: 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.amber),
              width: 10,
              height: 60 * getPercent(total),
            )
          ]),
          const SizedBox(height: 4),
          Text(type.getDayOfWeekString())
        ],
      );
    }
    return widget;
  }
}
