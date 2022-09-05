import 'package:flutter/material.dart';
import 'package:section_2/models/expense.dart';

class ExpenseWidget extends StatelessWidget {
  final Expense expense;
  final VoidCallback delete;

  const ExpenseWidget({
    Key? key,
    required this.expense,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(expense.name),
        subtitle: Text(expense.getDateTime("MMMM dd, yyyy")),
        trailing: IconButton(
          onPressed: delete,
          icon: const Icon(Icons.delete),
          color: Colors.red,
        ),
        leading: ClipOval(
          child: Container(
            padding: const EdgeInsets.all(4),
            height: 56,
            width: 56,
            color: Colors.orange,
            child: FittedBox(
              alignment: Alignment.center,
              fit: BoxFit.contain,
              child: Text(
                expense.getDollar(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
