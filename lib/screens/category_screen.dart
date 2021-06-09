import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/helpers/colors_helper.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
import 'package:flutter_budget_ui/models/expense_model.dart';
import 'package:flutter_budget_ui/widgets/radio_painter.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  const CategoryScreen({this.category}) : assert(category != null);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpense(Category category) {
    List<Widget> addExpense = [];
    category.expenses.forEach((Expense expense) {
      addExpense.add(Container(
        margin: EdgeInsets.all(10.0),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                expense.name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '-£${expense.cost.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              )
            ],
          ),
        ),
      ));
    });

    return Column(
      children: addExpense,
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            iconSize: 30.0,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.0,
              width: double.infinity,
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2))
                  ]),
              child: CustomPaint(
                foregroundPainter: RadioPainter(
                    bgColor: Colors.grey[200],
                    lineColor: getColor(context, percent),
                    percent: percent,
                    width: 15.0),
                child: Center(
                  child: Text(
                    '£${amountLeft.toStringAsFixed(2)} / ${widget.category.maxAmount.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildExpense(widget.category),
          ],
        ),
      ),
    );
  }
}
