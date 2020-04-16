import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_tracker/widgets/chartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> userTransactions;
  Chart(this.userTransactions);

  List<Map<String, Object>> get _weekTransactions {
    return List.generate(7, (index) {
      final day = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );
      double amount = 0.0;
      for (var item in userTransactions) {
        if (item.date.day == day.day &&
            item.date.month == day.month &&
            item.date.year == day.year) {
          amount += item.amount;
        }
      }
      return {
        'day': DateFormat.E().format(day).substring(0, 1),
        'amount': amount
      };
    }).reversed.toList();
  }

  double get totalSpendingInAWeek {
    // double amount = 0;
    // for (var item in _weekTransactions) {
    //   amount += item['amount'];
    // }
    // return amount;
    return _weekTransactions.fold(0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ..._weekTransactions.map((trns) {
            return Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ChartBar(
                  label: trns['day'],
                  amount: (trns['amount'] as double),
                  totalAmountPerct: totalSpendingInAWeek == 0.0
                      ? 0.0
                      : (trns['amount'] as double) / totalSpendingInAWeek,
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
