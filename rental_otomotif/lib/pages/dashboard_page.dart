import 'package:flutter/material.dart';

void main() {
  runApp(const SewaKendaraanApp());
}

class SewaKendaraanApp extends StatelessWidget {
  const SewaKendaraanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Sewa Kendaraan',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  final List<Map<String, String>> menuItems = const [
    {
      'title': 'Motor Listrik',
      'image': 'assets/images/motor_listrik.jpeg',
    },
    {
      'title': 'Motor Matic',
      'image': 'assets/images/motor_matic.jpeg',
    },
    {
      'title': 'Motor Manual',
      'image': 'assets/images/motor_manual.png',
    },
    {
      'title': 'Mobil Manual',
      'image': 'assets/images/mobil_manual.png',
    },
    {
      'title': 'Elf',
      'image': 'assets/images/elf.jpeg',
    },
    {
      'title': 'Pick Up',
      'image': 'assets/images/pickup.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Sewa Kendaraan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: menuItems.map((item) {
            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail kendaraan
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Klik: ${item['title']}')),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      item['image']!,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
