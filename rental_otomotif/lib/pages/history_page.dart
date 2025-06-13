import 'package:flutter/material.dart';
import '../model/dummy_booking_history.dart'; 
import '../pages/booking_detail_history.dart';

// Dummy data untuk riwayat booking

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Definisi warna dari referensi (merah marun)
    const Color primaryColor = Color(0xFF8B0000); // Contoh warna merah marun
    const Color accentGreen = Color(0xFF4CAF50); // Hijau untuk tombol/status

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: primaryColor, // Mengubah warna AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Warna ikon di AppBar
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Search bar putih
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari transaksi',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down, size: 16, color: Colors.white), // Ikon putih
                    label: const Text('Semua Status', style: TextStyle(fontSize: 12, color: Colors.white)), // Teks putih
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white), // Border putih
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 30),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down, size: 16, color: Colors.white),
                    label: const Text('Semua Produk', style: TextStyle(fontSize: 12, color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 30),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down, size: 16, color: Colors.white),
                    label: const Text('Semua Tanggal', style: TextStyle(fontSize: 12, color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyBookingList.length, // Menggunakan dummyBookingList
        itemBuilder: (context, index) {
          final booking = dummyBookingList[index]; // Mengambil booking dari dummy list
          final place = booking.place;

          // Perhitungan durasi tetap ada karena ini bukan perhitungan harga
          final durationInDays = booking.endDate.difference(booking.startDate).inDays + 1;

          final bookingDateFormatted =
              '${booking.startDate.day} ${getMonthName(booking.startDate.month)} ${booking.startDate.year}';

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 2, // Tambah sedikit elevasi
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Sudut membulat
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Rental',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const Spacer(),
                      Text(
                        bookingDateFormatted,
                        style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 255, 254, 254)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: accentGreen, 
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          booking.status,
                          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontSize: 12), // Teks status hijau
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.more_vert, color: Colors.grey),
                    ],
                  ),
                  const Divider(height: 20, thickness: 1, color: Colors.grey),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0), // Gambar dengan sudut membulat
                        child: Image.asset(place.imageAsset, width: 70, height: 70, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              place.name,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '$durationInDays hari',
                              style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 154, 154, 154)),
                            ),
                            const SizedBox(height: 8),
                            // Menggunakan place.ticketPrice langsung untuk 'Total Harga'
                            Text(
                              'Total Harga: ${place.ticketPrice}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: primaryColor), // Warna teks total harga
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingDetailScreen(booking: booking),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentGreen, // Warna tombol hijau
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          textStyle: const TextStyle(fontSize: 13),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Sudut membulat
                        ),
                        child: const Text('Detail Booking'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String getMonthName(int month) {
    switch (month) {
      case 1: return 'Januari';
      case 2: return 'Februari';
      case 3: return 'Maret';
      case 4: return 'April';
      case 5: return 'Mei';
      case 6: return 'Juni';
      case 7: return 'Juli';
      case 8: return 'Agustus';
      case 9: return 'September';
      case 10: return 'Oktober';
      case 11: return 'November';
      case 12: return 'Desember';
      default: return '';
    }
  }
}