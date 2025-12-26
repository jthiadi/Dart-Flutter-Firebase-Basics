import 'package:flutter/material.dart';

import 'package:test_dart/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  bool _titleInvalid = false; // yg tiambah
  bool _amountInvalid = false; // yg d
  bool _dateInvalid = false; // yg ditn

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
      _dateInvalid = _selectedDate == null; //yang ditambah
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController
        .text); // tryParse('Hello') => null, tryParse('1.12') => 1.12
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
// ditambah
    setState(() {
      _titleInvalid = _titleController.text.trim().isEmpty;
      _amountInvalid = amountIsInvalid;
      _dateInvalid = _selectedDate == null;
    }
    );

    if (_titleInvalid || _amountInvalid || _dateInvalid) {
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount!,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color errorColor = Theme.of(context).colorScheme.error;
    final Color outline = Theme.of(context).colorScheme.outline;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'Title',
              errorText: _titleInvalid ? 'Please enter a title' : null,
              border: const OutlineInputBorder(), // biar selalu ada
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: outline), // pas lagi normal
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor), // pas ga ketik save
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: errorColor), // kalo error
              ),
            ),
          ),

          const SizedBox(height: 16),
          Column(
            children: [
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: '\$ ',
                  labelText: 'Amount',
                  errorText: _amountInvalid ? 'Please enter a valid amount' : null,
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: errorColor),
                  ),
                ),
              ),

              const SizedBox(width: 16),
              Row(
                children: [
                  const SizedBox(height: 100),

                  Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                        value: category,
                        child: Text("Category.${category.name}"),),
                    )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[                  const SizedBox(height:80),

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: _submitExpenseData,
                    child: const Text('Save Expense'),
                  ),],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
