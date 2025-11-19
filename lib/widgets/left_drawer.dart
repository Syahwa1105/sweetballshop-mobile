import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:sweetballshop/screens/menu.dart';
import 'package:sweetballshop/screens/product_form.dart';
import 'package:sweetballshop/screens/list_product.dart';
import 'package:sweetballshop/screens/login.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sweetball Shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Tempat produk sepak bola terbaik!',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),

          // HOME
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => MyHomePage()),
              );
            },
          ),

          // ALL PRODUCTS
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('All Products'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProductListPage(myProducts: false),
                ),
              );
            },
          ),

          // MY PRODUCTS
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Products'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProductListPage(myProducts: true),
                ),
              );
            },
          ),

          // ADD PRODUCT
          ListTile(
            leading: const Icon(Icons.add_box_outlined),
            title: const Text('Add Product'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProductFormPage(),
                ),
              );
            },
          ),

          const Divider(),

          // LOGOUT
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async {
              try {
                final response = await request.post(
                  "http://localhost:8000/auth/logout/",
                  {},
                );

                if (!context.mounted) return;

                if (response["status"] == true) {
                  final username = response["username"] ?? "";

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        username.isEmpty
                            ? "Logout berhasil."
                            : "Logout berhasil. See you again, $username.",
                      ),
                    ),
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginPage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        response["message"] ?? "Logout gagal.",
                      ),
                    ),
                  );
                }
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Gagal terhubung ke server."),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
