import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../models/expense.dart';


class ExpenseChart extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseChart({super.key, required this.expenses});

  Map<String, double> _calculateCategoryTotals() {
    final Map<String, double> categoryTotals = {};
    for (var expense in expenses) {
      categoryTotals.update(
        expense.category,
            (value) => value + expense.amount,
        ifAbsent: () => expense.amount,
      );
    }
    return categoryTotals;
  }

  @override
  Widget build(BuildContext context) {
    final categoryTotals = _calculateCategoryTotals();
    final categories = categoryTotals.keys.toList();
    final values = categoryTotals.values.toList();

    return BarChart(
      BarChartData(
        barGroups: List.generate(
          categories.length,
              (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: values[index],
                color: Colors.accents[index % Colors.accents.length],
              )
            ],
          ),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => Text(
                categories[value.toInt()],
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
