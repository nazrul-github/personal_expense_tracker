import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_tracker/models/transaction.dart';
import 'package:personal_expense_tracker/widgets/emptyTransaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function removeTransaction;

  TransactionList(this.userTransactions, this.removeTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: userTransactions.isEmpty
          ? EmptyTransaction()
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        '${userTransactions[index].title}',
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMEd()
                            .format(userTransactions[index].date),
                      ),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).accentColor,
                            size: 30,
                          ),
                          onPressed: () => this
                              .removeTransaction(userTransactions[index].id)),
                    ),
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
