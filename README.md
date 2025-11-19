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

## **Tugas 9 PBP - Integrasi Layanan Web Django dengan Aplikasi Flutter**

**1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?** <br>
Saat berkomunikasi dengan backend, data yang kita terima bentuknya masih berupa JSON mentah. Sebenarnya kita bisa saja langsung memakai Map<String, dynamic>, tetapi tanpa model akan terjadi beberapa masalah:
- Tidak ada validasi tipe
JSON bersifat dinamis, sehingga Flutter tidak tahu apakah price pasti integer, name pasti string, atau apakah nilai tertentu boleh null. Dengan model Dart, struktur datanya jauh lebih jelas.
- Null safety lebih aman
Flutter punya sistem null safety. Kalau kita pakai Map mentah, kita mudah melakukan kesalahan seperti mengakses key yang tidak ada atau mendapat nilai null yang tidak terduga. Model membantu mencegah error seperti itu.
- Lebih rapi dan mudah dirawat
Saat aplikasi berkembang, data produk mungkin bertambah (contoh: rating, stok, dll). Dengan model, kita hanya perlu menambah field di satu tempat, bukan memperbaiki parsing di banyak file lain.
- Lebih nyaman digunakan
Akses data menjadi lebih mudah, misalnya: product.fields.name

Jadi singkatnya, model Dart membuat proses parsing lebih aman, rapi, dan mudah dirawat ke depannya.

**2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.** <br>
Dalam tugas ini, sebenarnya kedua paket dipakai untuk tujuan yang berbeda:

http
- Dipakai untuk request biasa ke server, misalnya GET data publik.
- Tidak menyimpan cookie dan tidak otomatis menangani autentikasi.
- Cocok untuk mengambil data JSON tanpa perlu login.

CookieRequest
- Bagian dari package pbp_django_auth.
- Menyimpan session cookie setelah login.
- Request berikutnya otomatis membawa cookie → sehingga Django mengenali user.
- Dipakai untuk endpoint yang membutuhkan autentikasi (POST tambah produk, logout, dll).

Jadi singkatnya:
http → komunikasi umum
CookieRequest → komunikasi yang butuh login + sesi terjaga

**3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.** <br>
Setelah login, CookieRequest menyimpan cookie session user. Agar fitur seperti menambah produk, mengambil produk milik sendiri, dan logout bisa berjalan, seluruh halaman harus memakai instance CookieRequest yang sama.

Jika setiap halaman membuat instance CookieRequest baru:
- session tidak terbawa
- user dianggap belum login
- request ke backend otomatis ditolak

Dengan menggunakan Provider, kita "membagikan" satu instance CookieRequest ke semua widget, sehingga status login tetap konsisten di seluruh aplikasi.

**4.  Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?** <br>
Ada beberapa pengaturan penting:

a. Menambahkan 10.0.2.2 di ALLOWED_HOSTS
Android emulator tidak bisa memakai localhost, sehingga Django perlu mengizinkan koneksi dari host khusus emulator ini.
Tanpa itu, Django menolak request karena dianggap tidak aman.

b. Mengaktifkan CORS
Flutter Web mengirim request lintas origin. Jika CORS tidak diaktifkan, browser akan memblokir response dari Django.

c. Mengatur SameSite dan cookie
Supaya cookie sesi bisa dibaca oleh Flutter, khususnya Flutter web:
- cookie perlu menggunakan SameSite=None
- HTTPS untuk deployment (tidak wajib di localhost)

d. Menambah izin internet di Android
Android membatasi akses internet secara default.
Tanpa <uses-permission android:name="android.permission.INTERNET" />, aplikasi tidak bisa melakukan HTTP request sama sekali.

Jika konfigurasi-konfigurasi di atas salah:
- Flutter tidak bisa login
- Cookie tidak tersimpan
- Request POST/GET ditolak CORS
- Emulator menganggap server tidak dapat diakses
- Semua fitur yang bergantung server akan hang atau error

**5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.** <br>
Alur lengkapnya kira-kira seperti ini:
- Pengguna mengisi form pada Flutter.
- Flutter memvalidasi input di sisi UI.
- Flutter mengirim data melalui request.post() ke Django.
- Django menerima request, memprosesnya (misalnya menyimpan produk).
- Django membalas response JSON ke Flutter.
- Flutter membaca JSON tersebut → menampilkan pesan berhasil.
- Flutter men-trigger refresh data (memanggil GET dari endpoint JSON)
- Data baru yang sudah tersimpan muncul pada daftar produk.

Jadi seluruh prosesnya murni pertukaran JSON antara Flutter dan Django.

**6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.** <br>
1. Register
- Flutter mengirim username & password ke Django.
- Django membuat akun baru dan mengirimkan status kembali ke Flutter.
- Jika berhasil, Flutter mengarahkan user ke halaman login.

2. Login
- Flutter mengirim kredensial ke Django melalui request.login(...).
- Django mengecek kredensial.
- Jika benar, Django menyimpan session di cookie dan mengirim JSON yang berisi: username, status login, pesan sukses
- Flutter menyimpan cookie + jsonData melalui CookieRequest.
- Flutter lalu menampilkan halaman menu/homescreen sebagai tanda user sudah login.

3. Logout
- Flutter memanggil request.logout().
- Django menghapus session cookie.
- Flutter menghapus data user di CookieRequest.
- Aplikasi kembali ke halaman login.

Jadi seluruh alurnya fokus pada cookie session yang dikelola Django dan android/web yang mengikutinya melalui CookieRequest.

**7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).** <br>
Cara Saya Mengimplementasikan Checklist

Saya mengikuti list tugas satu per satu:

- Membuat model Dart
Saya membuat model Product agar parsing JSON lebih aman dan rapi.

- Membuat halaman daftar produk
Saya menggunakan FutureBuilder untuk mengambil data dari endpoint Django, lalu menampilkannya menggunakan ProductCard.

- Menampilkan detail produk
Saat card ditekan, saya navigasikan ke halaman detail.

- Menambahkan produk dari Flutter
Saya membuat form tambah produk yang mengirim data POST ke Django.

- Filter produk "My Products"
Saya menggunakan query parameter ?filter=my untuk menampilkan produk milik user.

- Membuat fitur login dan register
Saya menyesuaikan endpoint Django agar mengembalikan JSON yang benar, lalu menghubungkannya dengan Flutter melalui CookieRequest.

- Logout
Saya membuat tombol logout di drawer dan menghubungkannya ke Django menggunakan request.logout().

Semua fitur dipastikan saling terhubung, dari login → tambah produk → melihat produk → logout.
