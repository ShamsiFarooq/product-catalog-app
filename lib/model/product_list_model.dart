import 'package:product_catalog_app/model/meta.dart';
import 'package:product_catalog_app/model/review.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final String brand;
  final String sku;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String warrantyInformation;
  final String shippingInformation;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final String thumbnail;
  final List<String> images;
  final List<Review> reviews;
  final Meta? meta;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.brand,
    required this.sku,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.thumbnail,
    required this.images,
    required this.reviews,
    required this.meta,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      category: json['category'] ?? 'Uncategorized',
      brand: json['brand'] ?? 'No brand',
      sku: json['sku'] ?? 'Unknown',
      price: (json['price'] ?? 0).toDouble(),
      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
      tags: (json['tags'] as List?)?.map((e) => e.toString()).toList() ?? [],
      warrantyInformation: json['warrantyInformation'] ?? 'No info',
      shippingInformation: json['shippingInformation'] ?? 'Not available',
      returnPolicy: json['returnPolicy'] ?? 'No return',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 1,
      thumbnail: json['thumbnail'] ?? '',
      images: (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
      reviews: (json['reviews'] as List?)?.map((e) => Review.fromJson(e)).toList() ?? [],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }
}