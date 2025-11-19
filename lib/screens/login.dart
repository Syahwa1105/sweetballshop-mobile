import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'menu.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String _password = "";
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Sweetball Shop',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Username
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => _username = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Password
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: (value) => _password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Tombol Login
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    setState(() => _isLoading = true);

                    try {
                      const String baseUrl = "http://localhost:8000";
                      const String endpoint = "/auth/login/";

                      // FIX → pakai post(), bukan postJson()
                      final response = await request.post(
                        "$baseUrl$endpoint",
                        {
                          "username": _username,
                          "password": _password,
                        },
                      );

                      setState(() => _isLoading = false);

                      if (response['status'] == true) {
                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Selamat datang, ${_username}!"),
                          ),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              response['message'] ?? "Login gagal",
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      setState(() => _isLoading = false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                          Text("Gagal terhubung ke server."),
                        ),
                      );
                    }
                  },
                  child: const Text("Login"),
                ),

                const SizedBox(height: 16),

                // Link ke register
                TextButton(
                  child: const Text("Belum punya akun? Register di sini"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
