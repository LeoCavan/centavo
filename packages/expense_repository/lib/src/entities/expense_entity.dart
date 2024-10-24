import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/src/entities/entities.dart';
import 'package:expense_repository/src/models/models.dart';

class ExpenseEntity {
  String expenseId;
  Categories category;
  DateTime date;
  int amount;

  ExpenseEntity({
    required this.expenseId,
    required this.category,
    required this.date,
    required this.amount,
  });

  Map<String, Object?> toDocument() {
    return {
      'expenseId': expenseId,
      'category': category.toEntity().toDocument(),
      'date': date,
      'amount': amount,
    };
  }

  static ExpenseEntity fromDocument(Map<String, dynamic> doc) {
    return ExpenseEntity(
      expenseId: doc['expenseId'],
      category:
          Categories.fromEntity(CategoryEntity.fromDocument(doc['category'])),
      date: (doc['date'] as Timestamp).toDate(),
      amount: doc['amount'],
    );
  }
}
