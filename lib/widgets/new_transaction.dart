import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountCountroller = TextEditingController();
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountCountroller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    this._addTransaction(
      enteredTitle,
      enteredAmount,
    );
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
            FlatButton(
              onPressed: () => this._submitData(),
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
