import 'package:flutter/material.dart';
import 'package:sweetballshop/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _price = "";
  String _description = "";
  String _thumbnail = "";
  String _category = "shoes";
  bool _isFeatured = false;

  final List<String> _categories = [
    "shoes",
    "clothes",
    "accessories",
    "limited",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Tambah Produk',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // nama produk
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nama Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() => _name = value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama produk tidak boleh kosong!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // harga produk
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Harga Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() => _price = value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga produk tidak boleh kosong!";
                  }
                  if (double.tryParse(value) == null) {
                    return "Harga harus berupa angka!";
                  }
                  if (double.parse(value) <= 0) {
                    return "Harga harus lebih dari 0!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // deskripsi produk
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Deskripsi Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                maxLines: 4,
                onChanged: (value) {
                  setState(() => _description = value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi produk tidak boleh kosong!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // URL thumbnail (opsional)
              TextFormField(
                decoration: InputDecoration(
                  labelText: "URL Thumbnail (opsional)",
                  hintText: "https://contoh-gambar.com/produk.jpg",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.url,
                onChanged: (value) {
                  setState(() => _thumbnail = value);
                },
                validator: (value) {
                  // validasi jika diisi
                  if (value != null && value.isNotEmpty) {
                    if (!Uri.parse(value).isAbsolute) {
                      return "Masukkan URL yang valid!";
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // kategori produk
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Kategori Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                value: _category,
                items: _categories
                    .map((category) => DropdownMenuItem<String>(
                  value: category,
                  child: Text(category[0].toUpperCase() +
                      category.substring(1)),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() => _category = value!);
                },
              ),
              const SizedBox(height: 12),

              // produk Unggulan
              SwitchListTile(
                title: const Text("Tandai sebagai produk unggulan"),
                value: _isFeatured,
                onChanged: (value) {
                  setState(() => _isFeatured = value);
                },
              ),
              const SizedBox(height: 20),

              //tombol simpan
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Produk Berhasil Disimpan'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Text("Nama: $_name"),
                                Text("Harga: $_price"),
                                Text("Deskripsi: $_description"),
                                Text("Thumbnail: ${_thumbnail.isEmpty ? '(-)' : _thumbnail}"),
                                Text("Kategori: $_category"),
                                Text("Produk Unggulan: ${_isFeatured ? 'Ya' : 'Tidak'}"),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _formKey.currentState!.reset(); // reset semua field
                                setState(() {
                                  _category = "shoes";
                                  _isFeatured = false;
                                });
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text("Simpan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
