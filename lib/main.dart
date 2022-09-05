import 'package:flutter/material.dart';
import 'package:section_2/models/expense.dart';
import 'package:section_2/widgets/expense_screen.dart';
import 'package:section_2/widgets/new_expense.dart';

void main(List<String> args) {
  runApp(const PersonalExpense());
}

class PersonalExpense extends StatelessWidget {
  const PersonalExpense({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:
          // SafeArea(
          //   child:
          Frame(),
      // ),
    );
  }
}

class Frame extends StatefulWidget {
  const Frame({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FrameState();
  }
}

class _FrameState extends State<Frame> {
  List<Expense> list = [];
  var navigationIndex = 0;

  @override
  void initState() {
    super.initState();
    list.addAll([
      Expense(
        dateTime: DateTime(2022, 8, 31),
        name: 'Buy a Macbook',
        value: 2500,
      ),
      Expense(
        dateTime: DateTime(2022, 9, 1),
        name: 'Buy an Motorbike',
        value: 2000,
      ),
      Expense(
        dateTime: DateTime(2022, 9, 1),
        name: 'Buy a Lamp',
        value: 10,
      ),
      Expense(
        dateTime: DateTime(2022, 9, 2),
        name: 'Buy a Bike',
        value: 50,
      ),
      Expense(
        dateTime: DateTime(2022, 9, 2),
        name: 'Buy a Iphone',
        value: 500,
      ),
    ]);
  }

  void changeNavigation(index) {
    setState(() {
      navigationIndex = index;
    });
  }

  void showAddBottomSheet(BuildContext context) {
    // showBottomSheet(context: context, builder: builder)

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.amber,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SafeArea(child: NewExpenseWidget(add: add)),
        );
      },
    );
  }

  void delete(int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  void add(Expense expense) {
    setState(() {
      list.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expense'),
        actions: [
          IconButton(
              onPressed: () {
                showAddBottomSheet(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ExpenseScreen(list: list, delete: delete),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: navigationIndex,
          elevation: 0,
          backgroundColor: Colors.transparent,
          onTap: changeNavigation,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Add',
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              showAddBottomSheet(context);
            },
            child: const Icon(Icons.add),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
