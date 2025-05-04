import 'package:flutter/material.dart';
import 'package:product_catalog_app/core/constants.dart';
import 'package:product_catalog_app/model/product_list_model.dart';


class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text('${product.category[0].toUpperCase()}${product.category.substring(1)}', style: TextStyle(color: blueDark, fontWeight: FontWeight.bold, fontSize: 22)),
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
        
        
      
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Image carousel
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
      
            const SizedBox(height: 16),
      
            Text(product.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: blueDark)),
            const SizedBox(height: 4),
            Text("Brand: ${product.brand} • SKU: ${product.sku}",
                style: const TextStyle(color: Colors.grey)),
      
            const SizedBox(height: 12),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${product.price}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: teal)),
                if (product.discountPercentage > 0)
                  Text("-${product.discountPercentage.toStringAsFixed(1)}%",
                      style: TextStyle(color: mintLight, fontWeight: FontWeight.bold)),
              ],
            ),
      
            const SizedBox(height: 8),
      
            Text("Category: ${product.category[0].toUpperCase()}${product.category.substring(1)}", style: TextStyle(color: teal)),
            Wrap(
              spacing: 8,
              children: product.tags
                  .map((tag) => Chip(
                        label: Text(tag),
                        backgroundColor: blueLight.withValues (alpha: 0.2),
                        labelStyle: const TextStyle(color: blueDark),
                      ))
                  .toList(),
            ),
      
            const Divider(),
      
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text("${product.rating} / 5"),
                const SizedBox(width: 10),
                Text("Stock: ${product.stock}"),
              ],
            ),
      
            const Divider(),
      
            Text("Description", style: TextStyle(fontWeight: FontWeight.bold, color: blueDark)),
            const SizedBox(height: 6),
            Text(product.description),
      
            const Divider(),
      
            ListTile(
              leading: Icon(Icons.verified_user, color: teal),
              title: const Text("Warranty"),
              subtitle: Text(product.warrantyInformation),
            ),
            ListTile(
              leading: Icon(Icons.local_shipping, color: teal),
              title: const Text("Shipping Info"),
              subtitle: Text(product.shippingInformation),
            ),
            ListTile(
              leading: Icon(Icons.assignment_return, color: teal),
              title: const Text("Return Policy"),
              subtitle: Text(product.returnPolicy),
            ),
      
            const Divider(),
      
            Text("Customer Reviews",
                style: TextStyle(fontWeight: FontWeight.bold, color: blueDark)),
            ...product.reviews.map(
              (review) => ListTile(
                leading: const Icon(Icons.person),
                title: Text(review.reviewerName),
                subtitle: Text(review.comment),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      review.rating, (_) => const Icon(Icons.star, color: Colors.amber, size: 16)),
                ),
              ),
            ),
      
            const Divider(),
      
            if (product.meta?.qrCode != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Scan for More Info",
                      style: TextStyle(fontWeight: FontWeight.bold, color: blueDark)),
                  const SizedBox(height: 10),
                  Image.network(product.meta!.qrCode, height: 100),
                ],
              ),
      
            const SizedBox(height: 30),
      
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: blueLight,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      
    );
  }
}




