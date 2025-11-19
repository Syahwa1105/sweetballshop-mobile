import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sweetballshop/models/product.dart';
import 'package:sweetballshop/widgets/product_card.dart';
import 'package:sweetballshop/screens/product_detail.dart';

class ProductListPage extends StatefulWidget {
  final bool myProducts;

  const ProductListPage({super.key, this.myProducts = false});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    // ⬇️ BASE URL disesuaikan: web vs emulator Android
    final String baseUrl =
    kIsWeb ? "http://localhost:8000" : "http://10.0.2.2:8000";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.myProducts ? "My Products" : "All Products",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: request.get(
          widget.myProducts
              ? "$baseUrl/products/json/?filter=my"
              : "$baseUrl/products/json/",
        ),
        builder: (context, snapshot) {
          // error handling biar gak loading selamanya kalau request gagal
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Gagal memuat produk.\n${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data;

          if (data == null || (data is List && data.isEmpty)) {
            return const Center(
              child: Text("Tidak ada produk."),
            );
          }

          // encode snapshot ke JSON string
          final String rawJson = jsonEncode(data);

          // convert JSON → List<Product>
          List<Product> products = productFromJson(rawJson);

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(product: product),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
