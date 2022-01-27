import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) return;

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) return;

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2012),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              onSubmitted: (_) => _submitData(),
              keyboardType: TextInputType.number,
              // onChanged: (value) => amountInput = value,
            ),
            Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: _selectedDate == null ? Text('No Date Chosen!') : Text('Picked Date: ' + DateFormat.yMMMMd().format(_selectedDate!)),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text('Add Transaction'),
              style: ElevatedButton.styleFrom(
                // onPrimary: Colors.white,
                textStyle: Theme.of(context).textTheme.button,
                primary: Theme.of(context).primaryColor,
                elevation: 0,
              ),
              // style: ButtonStyle(
              //   backgroundColor: MaterialStateProperty.all(Colors.white),
              //   foregroundColor: MaterialStateProperty.all(Colors.purple),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
