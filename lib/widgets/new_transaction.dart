import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountCountroller = TextEditingController();
  DateTime _pickedDate;

  void _submitData() {
    if (_amountCountroller.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountCountroller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _pickedDate == null) {
      return;
    }
    this.widget._addTransaction(
          enteredTitle,
          enteredAmount,
          _pickedDate,
        );
    Navigator.of(context).pop();
  }

  void _showDateModal() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((selected) {
      if (selected == null) {
        return;
      }
      setState(() {
        _pickedDate = selected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: _titleController,
              onSubmitted: (_) => this._submitData(),
              // onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountCountroller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => this._submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _pickedDate == null
                    ? Text("No Date Picked!")
                    : Text(
                        "Picked date: ${DateFormat('E dd/MMM/yyyy').format(_pickedDate)}",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                FlatButton(
                  onPressed: _showDateModal,
                  child: Text(
                    "Choose Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
            RaisedButton(
              onPressed: () => _submitData(),
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Theme.of(context).textTheme.button.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
