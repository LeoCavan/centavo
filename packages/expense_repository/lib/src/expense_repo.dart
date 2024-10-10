import 'package:expense_repository/expense_repository.dart';

abstract class ExpenseRepository {
  Future<void> createCategory(Categories category);

  Future<List<Categories>> getCategory();
}
