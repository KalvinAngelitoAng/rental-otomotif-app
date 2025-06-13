// booking_detail_screen.dart
import 'package:flutter/material.dart';
import '../model/dummy_booking_history.dart';

// Fungsi utilitas parsePrice dihapus karena tidak diperlukan

class BookingDetailScreen extends StatelessWidget {
  final Booking booking;

  const BookingDetailScreen({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final place = booking.place;

    // Definisi warna dari referensi (merah marun)
    const Color primaryColor = Color(0xFF8B0000); // Contoh warna merah marun
    const Color accentGreen = Color(0xFF4CAF50); // Hijau untuk status

    // Perhitungan durasi tetap ada karena ini bukan perhitungan harga
    final durationInDays = booking.endDate.difference(booking.startDate).inDays + 1;

    // Variabel pricePerDay dan totalPrice dihapus karena tidak ada perhitungan

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Transaksi', style: TextStyle(color: Colors.white)), // Teks putih
        backgroundColor: primaryColor, // Warna AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Ikon putih
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(place.imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        place.location,
                        style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 137, 137, 137)),
                      ),
                    ],
                  ),
                  const Divider(height: 32, color:  Color.fromARGB(255, 137, 137, 137)), // Warna divider

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Status Transaksi:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color.fromARGB(221, 0, 0, 0)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: accentGreen,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          booking.status,
                          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold), // Teks status hijau
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const Text('Detail Rental:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)),
                  const SizedBox(height: 8),
                  buildDetailRow('Tanggal Mulai:',
                      '${booking.startDate.day}/${booking.startDate.month}/${booking.startDate.year}'),
                  buildDetailRow('Tanggal Selesai:',
                      '${booking.endDate.day}/${booking.endDate.month}/${booking.endDate.year}'),
                  buildDetailRow('Durasi Rental:', '$durationInDays hari'),
                  // Menggunakan place.ticketPrice langsung untuk 'Harga per Hari'
                  buildDetailRow('Harga per Hari:', place.ticketPrice),
                  // Menggunakan place.ticketPrice langsung untuk 'Total Harga'
                  buildDetailRow(
                      'Total Harga:',
                      place.fixedTotalPriceString, // Langsung menggunakan string ticketPrice dari place
                      isBoldValue: true, valueColor: const Color.fromARGB(255, 136, 0, 0)), // Total harga dengan warna primer
                  const Divider(height: 32, color: Color.fromARGB(255, 137, 137, 137)),

                  const Text('Deskripsi Produk:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)),
                  const SizedBox(height: 8),
                  Text(
                    place.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 15, color: Color.fromARGB(221, 0, 0, 0)),
                  ),
                  const Divider(height: 32, color: Color.fromARGB(255, 137, 137, 137)),

                  const Text('Informasi Operasional:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87)),
                  const SizedBox(height: 8),
                  buildDetailRow('Hari Buka:', place.openDays),
                  buildDetailRow('Jam Buka:', place.openTime),
                  const SizedBox(height: 20),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor, // Warna tombol kembali
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Sudut membulat
                      ),
                      child: const Text('Kembali'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk menampilkan detail dalam baris (ditambahkan parameter valueColor)
  Widget buildDetailRow(String label, String value, {bool isBoldValue = false, Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isBoldValue ? FontWeight.bold : FontWeight.normal,
                color: valueColor ?? Colors.black, // Menggunakan valueColor jika ada
              ),
            ),
          ),
        ],
      ),
    );
  }
}