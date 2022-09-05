import 'package:flutter/material.dart';
import 'package:section_2/models/expense.dart';
import 'package:section_2/models/expense_type.dart';
import 'package:section_2/widgets/expense_type_list_widget.dart';
import 'package:section_2/widgets/expense_list_widget.dart';

class ExpenseScreen extends StatelessWidget {
  final List<Expense> list;
  final Function delete;
  const ExpenseScreen({
    Key? key,
    required this.list,
    required this.delete,
  }) : super(key: key);

  List<ExpenseType> initTypeListFromExpense(List<Expense> list) {
    List<ExpenseType> typeList = [
      for (int i = 1; i <= DateTime.daysPerWeek; i++)
        ExpenseType(dayOfWeek: i, total: 0)
    ];

    for (var expense in list) {
      typeList[expense.dateTime.weekday - 1].total += expense.value;
    }

    return typeList;
  }

  @override
  Widget build(BuildContext context) {
    var widgets = [
      ExpenseTypeListWidget(typeList: initTypeListFromExpense(list)),
      if (list.isEmpty)
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'No expense here!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 120,
                  width: 200,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset('assets/images/orange.jpg'),
                  ),
                )
              ],
            ),
          ),
        )
      else
        Expanded(
          child: ExpenseListWidget(delete: delete, list: list),
        ),
    ];
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Column(children: widgets);
    } else {
      return Row(children: widgets);
    }
  }
}
