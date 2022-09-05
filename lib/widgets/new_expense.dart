import 'dart:math';

import 'package:flutter/material.dart';
import 'package:section_2/models/expense.dart';
import 'package:intl/intl.dart';

class NewExpenseWidget extends StatefulWidget {
  final Function add;

  const NewExpenseWidget({Key? key, required this.add}) : super(key: key);

  @override
  State<NewExpenseWidget> createState() => _NewExpenseWidgetState();
}

class _NewExpenseWidgetState extends State<NewExpenseWidget> {
  final dateController = TextEditingController();
  final dateFormat = DateFormat('dd/MM/yyyy');
  final nameController = TextEditingController();
  final dollarController = TextEditingController();
  var piiii = 16.0;
  @override
  void initState() {
    super.initState();
    dateController.text = dateFormat.format(DateTime.now());
  }

  void pickDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: dateFormat.parse(dateController.text),
        firstDate: DateTime(now.year - 1),
        lastDate: DateTime(now.year + 1));

    if (dateTime != null) {
      dateController.text = dateFormat.format(dateTime);
    }
  }

  void _resetForm() {
    nameController.clear();
    dollarController.clear();
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  void addCurrentThing(BuildContext context) {
    setState(() {
      piiii = 56;
    });
    // String name = nameController.text;
    // double value = double.parse(dollarController.text);
    // DateTime dateTime = DateFormat('dd/MM/yyyy').parse(dateController.text);
    // Expense expense = Expense(dateTime: dateTime, name: name, value: value);
    // widget.add(expense);
    // _resetForm();
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 400,
        padding: EdgeInsets.all(piiii),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'Add a thing',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            SizedBox(
              height: 76,
              child: Center(
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.category),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Enter the description',
                    labelText: 'What did you buy?',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 76,
              child: Center(
                child: TextField(
                  controller: dollarController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    hintText: 'Enter the price of thing above',
                    labelText: 'How many dollar?',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 76,
              child: Center(
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 4,
                      child: TextField(
                        enabled: false,
                        controller: dateController,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: 'dd/MM/yyyy',
                          labelText: 'Date',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      flex: 1,
                      child: ClipOval(
                        child: InkWell(
                          child: Container(
                            height: 56,
                            width: 56,
                            color: Colors.blue,
                            child: Center(
                              child: IconButton(
                                color: Colors.white,
                                icon: const Icon(Icons.date_range_outlined),
                                onPressed: () => pickDate(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    addCurrentThing(context);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
