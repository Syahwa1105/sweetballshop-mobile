import 'package:flutter/material.dart';
import 'package:sweetballshop/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final f = product.fields;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          f.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                f.thumbnail.isEmpty
                    ? "https://via.placeholder.com/400"
                    : f.thumbnail,
                width: double.infinity,
                height: 260,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 260,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 70),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Title
            Text(
              f.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Price
            Text(
              "Rp ${f.price}",
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            // Category
            Row(
              children: [
                const Icon(Icons.category, size: 20),
                const SizedBox(width: 8),
                Text(
                  f.category,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Featured
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: f.isFeatured ? Colors.orange : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  f.isFeatured ? "Featured Product" : "Regular Product",
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Description
            Text(
              f.description,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
