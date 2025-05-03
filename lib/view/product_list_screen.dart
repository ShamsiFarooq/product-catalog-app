
import 'package:flutter/material.dart';
import 'package:product_catalog_app/controller/product_provider.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                final product = provider.products[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      product.thumbnail,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.title),
                    subtitle: Text("₹${product.price.toStringAsFixed(2)}\n⭐ ${product.rating}"),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}