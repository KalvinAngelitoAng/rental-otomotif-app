import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String image;

  const DetailPage({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    final detail = _getKendaraanDetail(title);

    final specsList = detail['specs'] as List<String>? ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF800000),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar kendaraan
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Nama Kendaraan
            Text(
              detail['name'] ?? title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF800000),
              ),
            ),
            const SizedBox(height: 10),

            // Deskripsi
            Text(
              detail['description'] ?? '',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Spesifikasi Teknis
            const Text(
              "Spesifikasi Teknis:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...specsList.map(
              (spec) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• "),
                  Expanded(
                    child: Text(spec, style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Harga
            Text(
              "Harga Sewa: ${detail['price'] ?? '-'}/hari",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Booking
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF800000),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Fitur booking belum tersedia.'),
                    ),
                  );
                },
                child: const Text(
                  "Booking Sekarang",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> _getKendaraanDetail(String title) {
    switch (title) {
      case 'Mobil Manual':
        return {
          "name": "Toyota Innova Zenix",
          "description":
              "MPV dengan desain elegan dan efisiensi bahan bakar tinggi.",
          "specs": [
            "Transmisi Manual",
            "Kapasitas 7 penumpang",
            "Mesin 2.0L",
            "ABS",
            "Dual Airbags",
          ],
          "price": "Rp 500.000",
        };
      case 'Mobil Matic':
        return {
          "name": "Toyota Avanza",
          "description":
              "Mobil keluarga favorit dengan transmisi otomatis yang nyaman.",
          "specs": [
            "Transmisi Otomatis",
            "Kapasitas 7 penumpang",
            "Mesin 1.3L",
            "AC Dingin",
            "Audio Touchscreen",
          ],
          "price": "Rp 450.000",
        };
      case 'Motor Listrik':
        return {
          "name": "Viar EV1 Electric Scooter",
          "description":
              "Motor listrik ramah lingkungan dengan desain futuristik.",
          "specs": [
            "Baterai 60V",
            "Jarak tempuh 60 km",
            "Kecepatan Maks 60 km/jam",
            "Waktu Charging 5 jam",
          ],
          "price": "Rp 150.000",
        };
      case 'Motor Matic':
        return {
          "name": "Honda Vario 125",
          "description":
              "Motor matic modern dan irit bahan bakar untuk penggunaan harian.",
          "specs": ["Mesin 125cc", "Idling Stop System", "CBS", "Bagasi luas"],
          "price": "Rp 120.000",
        };
      case 'Pick Up':
        return {
          "name": "Mitsubishi L300",
          "description":
              "Kendaraan niaga andalan untuk angkut barang dengan muatan besar.",
          "specs": [
            "Diesel",
            "Kapasitas 2–3 orang",
            "Bak luas",
            "Transmisi Manual",
          ],
          "price": "Rp 400.000",
        };
      case 'Elf':
        return {
          "name": "Isuzu Elf",
          "description":
              "Minibus nyaman untuk perjalanan wisata dan rombongan.",
          "specs": [
            "Kapasitas 16 penumpang",
            "AC Dingin",
            "Audio",
            "Transmisi Manual",
          ],
          "price": "Rp 800.000",
        };
      default:
        return {
          "name": title,
          "description": "Detail kendaraan tidak ditemukan.",
          "specs": [],
          "price": "-",
        };
    }
  }
}
