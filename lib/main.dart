import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

// kita mulai dari halaman login
import 'package:sweetballshop/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<CookieRequest>(
      // CookieRequest akan dibagikan ke seluruh widget di bawahnya
      create: (_) => CookieRequest(),
      child: MaterialApp(
        title: 'Sweetball Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.blueAccent[400]),
        ),
        // ⬇⬇⬇ Halaman pertama sekarang adalah LoginPage, bukan MyHomePage
        home: const LoginPage(),
      ),
    );
  }
}
