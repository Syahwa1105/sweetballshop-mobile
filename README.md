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

## **Tugas 8 PBP - Flutter Navigation, Layouts, Forms, and Input Elements**

**1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?** <br>
Navigator.push() digunakan untuk menambahkan halaman baru ke dalam tumpukan (stack) navigasi tanpa menghapus halaman sebelumnya. Artinya, pengguna masih bisa kembali ke halaman awal menggunakan tombol “back”.
Sedangkan Navigator.pushReplacement() akan menggantikan halaman yang sedang aktif dengan halaman baru, sehingga pengguna tidak dapat kembali ke halaman sebelumnya.

Dalam aplikasi Sweetball Shop, saya menggunakan Navigator.push() untuk membuka halaman Form Tambah Produk, karena setelah pengguna menambah produk, mereka mungkin ingin kembali ke halaman utama.
Sedangkan Navigator.pushReplacement() digunakan pada menu Halaman Utama di LeftDrawer, supaya ketika berpindah ke halaman utama, halaman sebelumnya tidak lagi tersimpan dalam stack (mencegah duplikasi halaman yang sama saat navigasi berulang).

**2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?** <br>
Struktur utama setiap halaman dalam aplikasi saya mengikuti hierarchy widget yang konsisten, dimulai dari Scaffold sebagai kerangka dasar halaman.
- AppBar digunakan untuk menampilkan judul halaman dan memberikan identitas yang seragam di seluruh aplikasi, misalnya dengan warna biru khas “Sweetball Shop”.
- Drawer (yang diimplementasikan melalui widget LeftDrawer) berfungsi sebagai navigasi samping untuk berpindah antarhalaman, seperti menuju halaman utama atau form tambah produk.

Dengan pendekatan ini, setiap halaman memiliki tampilan dan struktur yang konsisten sehingga pengguna menjadi lebih nyaman dan terarah.

**3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.** <br>
Penggunaan widget seperti Padding, SingleChildScrollView, dan ListView membantu menjaga tata letak (layout) antarmuka agar tetap rapi dan mudah digunakan, terutama pada halaman dengan banyak elemen input seperti form.
- Padding memberikan jarak antar-elemen agar tampilan tidak terlihat sempit dan mudah dibaca.
- SingleChildScrollView memungkinkan pengguna menggulir halaman saat konten melebihi ukuran layar, terutama saat form diisi pada perangkat dengan layar kecil.
- ListView berguna untuk menampilkan daftar elemen yang panjang dengan efisien dan dapat di-scroll otomatis.

Contohnya, pada halaman Form Tambah Produk, saya menempatkan seluruh elemen form di dalam SingleChildScrollView dan menambahkan Padding di setiap input field agar tata letaknya tetap nyaman di berbagai ukuran layar.

**4.  Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?** <br>
Untuk menjaga konsistens identitas visual aplikasi Sweetball Shop, saya menyesuaikan warna tema melalui properti ThemeData di file main.dart.
Saya menggunakan kombinasi warna biru utama (primary) dan aksen biru muda (secondary) yang merepresentasikan karakter modern dan energik dari brand toko. Warna ini diterapkan secara konsisten di seluruh elemen penting seperti AppBar, tombol utama, dan Drawer, sehingga pengguna dapat mengenali nuansa khas aplikasi sejak pertama kali membuka halaman. Cara ini membantu menjaga tampilan aplikasi tetap selaras dan terlihat rapi di setiap halaman, sehingga identitas brand-nya tetap terasa meskipun pengguna berpindah antarhalaman.
