import 'package:test_dart/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:test_dart/widgets/expenses_list/expenses_list.dart';
import 'package:test_dart/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }


//  yang ditambah
  Map<Category, double> calculateCategoryExpenses() {
    final Map<Category, double> categoryExpenses = {
      Category.food: 0,
      Category.travel: 0,
      Category.leisure: 0,
      Category.work: 0,
    };

    for (final expense in _registeredExpenses) {
      categoryExpenses.update(expense.category, (value) => value = expense.amount);
    }

    return categoryExpenses;
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = Column(
        children: [
          const SizedBox(height: 20),

          SizedBox(
            height: 220,
            child: ChartBar(
              values: calculateCategoryExpenses().values.toList(),
              icons: Category.values.map((e) => categoryIcons[e]!).toList(),
            ),
          ),
          const SizedBox(height: 15),

          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      );


    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: mainContent,
    );
  }
}

// tambah ini
class ChartBar extends StatelessWidget {
  final List<double> values;
  final List<IconData> icons;

  const ChartBar({
    required this.values,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color surface = Theme.of(context).colorScheme.onPrimary;

    final maxValue = values.reduce((value, element) => value > element ? value : element);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            primaryColor.withAlpha(50), // begin
            surface, // end
          ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,),
          borderRadius: BorderRadius.circular(10),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
                (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0), // Add horizontal padding here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 125,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 80,
                              color: Colors.transparent,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: FractionallySizedBox(
                              heightFactor: values[index] / maxValue, // biar dia bisa adjust sesuai value
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),
                    Icon(
                      icons[index],
                      size: 30, // Adjust icon size as needed
                      color: primaryColor, // Use primary color for icon
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
