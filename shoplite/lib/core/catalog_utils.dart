import '../models/product.dart';

int gridColumnCount(double width) {
  if (width < 600) {
    return 2;
  }
  if (width < 900) {
    return 3;
  }
  return 4;
}

List<String> categoriesOf(List<Product> products) {
  return {
    for (final product in products)
      if (product.category.isNotEmpty) product.category,
  }.toList()..sort();
}

List<Product> filterProducts(
  List<Product> products, {
  String? category,
  String query = '',
}) {
  final normalizedQuery = query.trim().toLowerCase();

  return products.where((product) {
    final matchesCategory =
        category == null || category.isEmpty || product.category == category;
    if (!matchesCategory) {
      return false;
    }

    if (normalizedQuery.isEmpty) {
      return true;
    }

    return product.title.toLowerCase().contains(normalizedQuery);
  }).toList();
}
