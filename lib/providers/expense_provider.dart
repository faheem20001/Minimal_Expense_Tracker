import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/expense.dart';


class ExpenseProvider with ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Expense> _expenses = [];
  bool _isLoading = false;

  List<Expense> get expenses => _expenses;
  bool get isLoading => _isLoading;

  double get totalExpenses {
    return _expenses.fold(0, (sum, expense) => sum + expense.amount);
  }

  Future<void> loadExpenses() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _dbHelper.getAllExpenses();
      _expenses = data.map((e) => Expense.fromMap(e)).toList();
    } catch (e) {
      debugPrint('Error loading expenses: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addExpense(Expense expense) async {
    try {
      await _dbHelper.insertExpense(expense.toMap());
      await loadExpenses();
    } catch (e) {
      debugPrint('Error adding expense: $e');
    }
  }

  Future<void> deleteExpense(int id) async {
    try {
      await _dbHelper.deleteExpense(id);
      await loadExpenses();
    } catch (e) {
      debugPrint('Error deleting expense: $e');
    }
  }
}
