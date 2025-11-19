import 'package:flutter/material.dart';
import 'package:sweetballshop/screens/product_form.dart';
import 'package:sweetballshop/screens/list_product.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;

  const ItemCard({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // SnackBar tetap ditampilkan seperti tugas sebelumnya
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol $name!")),
            );

          // Navigasi sesuai tombol
          if (name == "Create Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductFormPage(),
              ),
            );
          }

          if (name == "All Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductListPage(myProducts: false),
              ),
            );
          }

          if (name == "My Products") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductListPage(myProducts: true),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 30),
                const SizedBox(height: 6),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
