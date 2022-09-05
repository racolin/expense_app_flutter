import 'package:flutter/material.dart';
import 'package:section_2/models/expense.dart';
import 'expense_widget.dart';

class ExpenseListWidget extends StatelessWidget {
  final List<Expense> list;
  final Function delete;
  const ExpenseListWidget({
    Key? key,
    required this.list,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      itemBuilder: (context, i) {
        return ExpenseWidget(
          expense: list[i],
          delete: () => delete(i),
        );
      },
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      itemCount: list.length,
    );
  }
}
