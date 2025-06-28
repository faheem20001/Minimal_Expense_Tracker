import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';


class MonthlyBarChart extends StatelessWidget {
  final List<Expense> expenses;

  const MonthlyBarChart({super.key, required this.expenses});

  Map<String, double> _calculateMonthlyTotals() {
    final Map<String, double> monthlyTotals = {};
    final now = DateTime.now();

    for (var i = 5; i >= 0; i--) {
      final month = DateTime(now.year, now.month - i);
      final key = DateFormat('MMM yyyy').format(month);
      monthlyTotals[key] = 0;
    }

    for (var expense in expenses) {
      final monthKey = DateFormat('MMM yyyy').format(expense.date);
      if (monthlyTotals.containsKey(monthKey)) {
        monthlyTotals[monthKey] = monthlyTotals[monthKey]! + expense.amount;
      }
    }

    return monthlyTotals;
  }

  @override
  Widget build(BuildContext context) {
    final monthlyTotals = _calculateMonthlyTotals();
    final months = monthlyTotals.keys.toList();
    final values = monthlyTotals.values.toList();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '\$${rod.toY.toStringAsFixed(2)}',
                TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() < months.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      months[value.toInt()],
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(fontSize: 10),
                );
              },
              reservedSize: 30,
            ),
          ),
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(months.length, (index) {
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: values[index],
                color: Theme.of(context).colorScheme.primary,
                width: 16,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
