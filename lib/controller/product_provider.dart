
import 'package:flutter/foundation.dart';
import 'package:product_catalog_app/model/product_list_model.dart';
import 'package:product_catalog_app/service/product_list_service.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [];
  final bool _isLoading = true;
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];
  List<String> categories = [];
  String selectedCategory = 'All';

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    try {
      allProducts = await ApiService().fetchProducts();

      // Generate category list dynamically
      final categorySet = <String>{};
for (var product in allProducts) {
  final formattedCategory = product.category[0].toUpperCase() + product.category.substring(1);
  categorySet.add(formattedCategory);
}
categories = ['All', ...categorySet];


      filteredProducts = allProducts;
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
   void filterByCategory(String category) {
  selectedCategory = category;
  if (category == 'All') {
    filteredProducts = allProducts;
  } else {
    filteredProducts = allProducts.where(
      (p) => p.category.toLowerCase() == category.toLowerCase(),
    ).toList();
  }
  notifyListeners();
}

}
