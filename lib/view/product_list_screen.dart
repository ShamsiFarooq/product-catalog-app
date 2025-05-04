
import 'package:flutter/material.dart';
import 'package:product_catalog_app/controller/product_provider.dart';
import 'package:product_catalog_app/view/product_card.dart';
import 'package:provider/provider.dart';


class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
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
                  children: provider.categories.map((cat) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: provider.selectedCategory == cat,
                      onSelected: (_) => provider.filterByCategory(cat),
                    ),
                  )).toList(),
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
                    childAspectRatio: 0.7,
                  ),
                  itemCount: provider.filteredProducts.length,
                  itemBuilder: (ctx, i) => ProductCard(
                    product: provider.filteredProducts[i],
                    
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



// class ProductListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<ProductProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text("Products")),
//       body: provider.isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: provider.products.length,
//               itemBuilder: (context, index) {
//                 final product = provider.products[index];
//                 return Card(
//                   margin: const EdgeInsets.all(10),
//                   child: ListTile(
//                     leading: Image.network(
//                       product.thumbnail,
//                       width: 50,
//                       fit: BoxFit.cover,
//                     ),
//                     title: Text(product.title),
//                     subtitle: Text("₹${product.price.toStringAsFixed(2)}\n⭐ ${product.rating}"),
//                     isThreeLine: true,
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }