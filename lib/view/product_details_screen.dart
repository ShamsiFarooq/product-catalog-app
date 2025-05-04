import 'package:flutter/material.dart';
import 'package:product_catalog_app/model/product_list_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: product.images.length,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(product.images[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(product.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(product.description),
            SizedBox(height: 10),
            Text('Price: \$${product.price}', style: TextStyle(fontSize: 16)),
            //Text('Stock: ${product.stock}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}


// class ProductDetailScreen extends StatelessWidget {
//   final Product product;

//   const ProductDetailScreen({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFDEBE1),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: const [
//           Icon(Icons.shopping_cart_outlined),
//           SizedBox(width: 16),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Center(
//             child: Image.network(product.thumbnail, height: 220),
//           ),
//           const SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: Text(
//               product.title,
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//             child: Text(
//               product.description,
//               style: const TextStyle(fontSize: 16, color: Colors.black87),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '\$${product.price}',
//                   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Row(
//                   children: [
//                     const Icon(Icons.star, color: Colors.orangeAccent, size: 20),
//                     Text(product.rating.toString()),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.all(24),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//               ),
//               onPressed: () {},
//               child: const Text('Add to Cart', style: TextStyle(fontSize: 16)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }