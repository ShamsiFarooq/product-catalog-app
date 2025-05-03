import 'package:flutter/foundation.dart';
import 'package:product_catalog_app/model/product_list_model.dart';
import 'package:product_catalog_app/service/product_list_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = true;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await ApiService().fetchProducts();
    } catch (e) {
      print('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
