import 'package:flutter/material.dart';
import 'package:product_catalog_app/controller/product_provider.dart';
import 'package:product_catalog_app/core/constants.dart';
import 'package:product_catalog_app/view/product_card.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: TextStyle(color: blueDark, fontWeight: FontWeight.bold, fontSize: 22)),
        backgroundColor: teal.withValues(alpha: 0.2),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: blueDark),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: blueDark,),
            onPressed: () {
             
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: blueDark),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, _) {
          if (provider.filteredProducts.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      provider.categories
                          .map(
                            (cat) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: ChoiceChip(
                                
                                label: Text(cat),
                                selected: provider.selectedCategory == cat,
                                onSelected:
                                    (_) => provider.filterByCategory(cat),
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.5,
                                        color: provider.selectedCategory == cat
                                            ? teal
                                            : Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.62,
                  ),
                  itemCount: provider.filteredProducts.length,
                  itemBuilder:
                      (ctx, i) =>
                          ProductCard(product: provider.filteredProducts[i]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
