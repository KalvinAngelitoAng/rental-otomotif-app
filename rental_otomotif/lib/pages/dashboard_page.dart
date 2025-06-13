import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:rental_otomotif/pages/detail_page.dart'; 

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  // DATA MENU
  final List<Map<String, String>> menuItems = const [
    {
      'title': 'Motor Listrik',
      'image': 'images/motor_listrik.jpeg',
    },
    {
      'title': 'Motor Matic',
      'image': 'images/motor_matic.jpeg',
    },
    {
      'title': 'Motor Manual',
      'image': 'images/motor_manual.png',
    },
    {
      'title': 'Mobil Matic',
      'image': 'images/mobil_matic.png',
    },
    {
      'title': 'Elf',
      'image': 'images/elf.jpeg',
    },
    {
      'title': 'Pick Up',
      'image': 'images/pickup.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Sewa Kendaraan'),
        centerTitle: true,
      ),

      // ===== BODY =====
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: menuItems.map((item) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      item['image']!,
                      height: 80,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.error, size: 80),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              title: item['title']!,
                              imagePath: item['image']!,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Detail'),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),

      // ===== FLOATING‑ACTION BUTTON GANDA =====
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.blueAccent,
        overlayOpacity: 0.1,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.person),
            label: 'Profil',
            onTap: () => Navigator.pushNamed(context, '/profile_page'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.shopping_cart),
            label: 'Booking',
            onTap: () => Navigator.pushNamed(context, '/booking_form_page'),
          ),
        ],
      ),
    );
  }
}
