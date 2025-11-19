import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String _password1 = "";
  String _password2 = "";
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register Sweetball Shop",
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
              children: [
                // Username
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => _username = value,
                  validator: (value) =>
                  value!.isEmpty ? "Username tidak boleh kosong!" : null,
                ),
                const SizedBox(height: 12),

                // Password 1
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: (value) => _password1 = value,
                  validator: (value) {
                    if (value!.isEmpty) return "Password wajib diisi!";
                    if (value.length < 8) return "Minimal 8 karakter.";
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // Password 2
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Konfirmasi Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: (value) => _password2 = value,
                  validator: (value) =>
                  value != _password1 ? "Password tidak sama!" : null,
                ),
                const SizedBox(height: 20),

                // Tombol Register
                _loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    setState(() => _loading = true);

                    try {
                      const String baseUrl = "http://localhost:8000";
                      const String endpoint = "/auth/register/";

                      final response = await request.post(
                        "$baseUrl$endpoint",
                        {
                          "username": _username,
                          "password": _password1,
                        },
                      );


                      setState(() => _loading = false);

                      if (response['status'] == true) {
                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(response['message']),
                          ),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            Text(response['message'] ?? "Gagal register"),
                          ),
                        );
                      }
                    } catch (e) {
                      setState(() => _loading = false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                          Text("Gagal terhubung ke server."),
                        ),
                      );
                    }
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
