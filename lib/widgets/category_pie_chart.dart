import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../models/expense.dart';


class CategoryPieChart extends StatelessWidget {
  final List<Expense> expenses;

  const CategoryPieChart({super.key, required this.expenses});

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

    if (values.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        sections: List.generate(categories.length, (index) {
          final percentage = (values[index] / values.reduce((a, b) => a + b)) * 100;
          return PieChartSectionData(
            color: _getCategoryColor(categories[index]),
            value: values[index],
            title: '${percentage.toStringAsFixed(1)}%',
            radius: 60,
            titleStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          );
        }),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    const colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.pink,
      Colors.amber,
    ];
    return colors[category.hashCode % colors.length];
  }
}
