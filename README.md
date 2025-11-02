# Sweetballshop-Mobile

Nama: Qoriana Syahwa Maharani. <br>
NPM: 2406437533 <br>
Kelas: PBP-B

Sweetball Shop - Mobile

## **Tugas 7 PBP - Elemen Dasar Flutter**  

**1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.** <br>
Widget tree adalah struktur hierarki yang menggambarkan bagaimana setiap widget saling bertumpuk dan membentuk tampilan aplikasi Flutter. Setiap elemen di layar merupakan bagian dari pohon widget ini.
Widget yang berada di atas disebut parent (induk), sedangkan widget di dalamnya disebut child (anak). Parent bertanggung jawab mengatur tata letak dan posisi anak-anaknya. Contohnya, widget Column adalah parent yang bisa berisi beberapa child seperti Text, Row, atau GridView. Hubungan ini memungkinkan Flutter membangun antarmuka yang dinamis dan terstruktur dengan baik.

**2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.** <br>
Berikut adalah widget yang saya gunakan dalam proyek Sweetballshop serta fungsi masing-masing:

- MaterialApp – Sebagai kerangka utama aplikasi yang menerapkan tema dan gaya Material Design.
- Scaffold – Menyediakan struktur dasar halaman, seperti AppBar dan body.
- AppBar – Menampilkan judul aplikasi di bagian atas layar.
- Padding – Memberikan jarak di sekitar elemen agar tata letak lebih rapi.
- Column – Menyusun widget secara vertikal dari atas ke bawah.
- Row – Menyusun widget secara horizontal dalam satu baris.
Card – Membuat tampilan berbentuk kartu dengan bayangan (digunakan pada InfoCard).
- Container – Sebagai wadah yang bisa diatur ukuran, padding, dan pewarnaannya.
- Text – Menampilkan teks statis seperti nama, NPM, dan kelas.
- Icon – Menampilkan ikon dari pustaka Material Icons.
- GridView.count – Menampilkan beberapa widget (ItemCard) dalam format grid dengan jumlah kolom tertentu.
- Material – Membungkus elemen agar mendapatkan efek Material Design (seperti efek sentuhan).
- InkWell – Memberikan efek “ripple” ketika elemen ditekan.
- SnackBar – Menampilkan pesan sementara di bagian bawah layar ketika tombol ditekan.
- Center – Memposisikan widget di tengah area yang tersedia.
- SizedBox – Memberikan jarak vertikal antar elemen.
- InfoCard (custom widget) – Menampilkan informasi identitas (nama, NPM, kelas).
- ItemCard (custom widget) – Menampilkan tombol berwarna yang berisi ikon dan teks.

**3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.** <br>
MaterialApp berfungsi sebagai pintu masuk utama aplikasi Flutter berbasis Material Design. Widget ini menyediakan konfigurasi global seperti tema warna (ThemeData), judul aplikasi, navigasi antar halaman, dan pengaturan debug banner.

MaterialApp sering digunakan sebagai widget root karena seluruh komponen Material seperti Scaffold, AppBar, SnackBar, dan lain-lain hanya dapat digunakan dengan benar jika berada di dalam konteks MaterialApp. Dengan kata lain, widget ini menjadi fondasi agar seluruh elemen desain Material dapat berfungsi.

**4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?** <br>
- StatelessWidget adalah widget yang tidak memiliki perubahan data internal (state). UI-nya bersifat tetap dan hanya akan diperbarui jika input dari luar berubah. Contoh: halaman statis, teks, atau ikon sederhana.
- StatefulWidget memiliki state yang dapat berubah selama aplikasi berjalan. Ketika state berubah, Flutter akan membangun ulang UI melalui metode setState(). Contoh: form input, tombol yang menampilkan jumlah klik, atau data dinamis dari API.

Saya memilih StatelessWidget untuk proyek ini karena semua data bersifat statis (nama, NPM, kelas, dan tombol). Tidak ada data yang perlu berubah selama aplikasi berjalan, jadi penggunaan StatelessWidget lebih efisien.

**5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?** <br>
BuildContext adalah objek yang merepresentasikan posisi suatu widget di dalam widget tree.
Objek ini penting karena memberikan akses ke informasi tentang lokasi widget, tema aplikasi, dan widget ancestor-nya.
Dalam metode build(BuildContext context), context digunakan untuk:
- Mengambil tema dengan Theme.of(context).
- Menampilkan pesan seperti ScaffoldMessenger.of(context).showSnackBar().
- Mengakses parent widget dalam hierarki untuk melakukan navigasi atau pengaturan tampilan.
Tanpa BuildContext, widget tidak dapat berinteraksi dengan elemen di sekitarnya.

**6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".** <br>
- Hot Reload: Memasukkan perubahan kode ke aplikasi yang sedang berjalan tanpa mengulang dari awal. State yang sedang aktif akan tetap dipertahankan. Fitur ini sangat berguna untuk menguji perubahan tampilan atau logika kecil dengan cepat.
- Hot Restart: Menjalankan ulang seluruh aplikasi dari awal, termasuk menginisialisasi ulang semua state. Biasanya digunakan jika ada perubahan besar seperti pada inisialisasi variabel global atau struktur root widget.

Jadi, hot reload mempertahankan state, sedangkan hot restart mengulang aplikasi dari awal.
