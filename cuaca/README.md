# 🌤️ Aplikasi Cuaca - Flutter Weather UI

Aplikasi Cuaca ini adalah proyek Flutter yang dirancang dengan tampilan antarmuka yang modern dan mendukung tema terang dan gelap. Aplikasi ini menampilkan informasi cuaca harian dan detail seperti kecepatan angin, kelembaban, dan peluang hujan, lengkap dengan ilustrasi SVG dan latar belakang bergambar sesuai kondisi cuaca.

## 🧩 Fitur Utama

    - 🔍 Pencarian lokasi (dengan daftar kota seperti Kalipare, Sumberpucung, Kepanjen, Malang)
    - 📆 Prakiraan cuaca mingguan (hari, ikon, dan suhu)
    - 🌬️ Detail cuaca: Angin, Hujan, Kelembaban
    - 🎨 Tema terang & gelap otomatis
    - 🖼️ Background dinamis berdasarkan jenis cuaca
    - 📱 Responsif untuk berbagai ukuran layar

## 📂 Struktur Folder
lib/
├── models/
│ └── weather_locations.dart
├── screens/
│ └── weather_app.dart
├── widgets/
│ ├── buildin_transform.dart
│ ├── humidity_detail_page.dart
| ├── rain_detail_page.dart
│ ├── search.dart
│ ├── single_weather.dart
| ├── slider_dot.dart
| ├── wind_detail_page.dart
├── main.dart

## 🌈 Cuaca yang Didukung

    - ☀️ Sunny
    - 🌙 Night
    - 🌧️ Rainy
    - ☁️ Cloudy

▶️ Cara Menjalankan

1. Clone repo ini:
   ```bash
   git clone https://github.com/username/flutter-cuaca.git
   cd flutter-cuaca

2. Jalankan perintah Flutter:
   ```bash
   flutter pub get
   flutter run

   
