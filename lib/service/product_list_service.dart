import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_catalog_app/model/product_list_model.dart';

class ApiService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      final List productsJson = json.decode(response.body)['products'];
      return productsJson.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
