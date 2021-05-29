import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  BarChart({this.expenses});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Weekly Spending',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
              ),
              iconSize: 30.0,
            ),
            Text(
              'Nov 10, 2020 - Nov 16, 2020',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  letterSpacing: 1.2),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward),
              iconSize: 30.0,
            )
          ],
        )
      ],
    );
  }
}
