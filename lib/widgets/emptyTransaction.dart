import 'package:flutter/material.dart';

class EmptyTransaction extends StatelessWidget {
  const EmptyTransaction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'No Transaction Added Yet',
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          child: Image.asset(
            'assests/images/waiting.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
