import '../entities/entities.dart';

class Categories {
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  String color;

  Categories({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });

  static final empty = Categories(
      categoryId: '', name: '', totalExpenses: 0, icon: '', color: '');

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      icon: icon,
      color: color,
    );
  }

  static Categories fromEntity(CategoryEntity entity) {
    return Categories(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpenses: entity.totalExpenses,
      icon: entity.icon,
      color: entity.color,
    );
  }
}
