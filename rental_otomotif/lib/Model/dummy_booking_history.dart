// dummy_booking_history.dart

class TourismPlace {
  final String name;
  final String location;
  final String description;
  final String openDays;
  final String openTime;
  final String ticketPrice;
  final String imageAsset;
  final List<String> imageUrls;
  final String fixedTotalPriceString;

  TourismPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageUrls,
    required this.fixedTotalPriceString,
  });
}

class Booking {
  final TourismPlace place;
  final DateTime startDate;
  final DateTime endDate;
  final String status;

  Booking({
    required this.place,
    required this.startDate,
    required this.endDate,
    this.status = 'Selesai',
  });
}

final List<Booking> dummyBookingList = [
  Booking(
    place: TourismPlace(
      name: 'Toyota Avanza',
      location: 'bali',
      description:
          'Mobil keluarga jenis MPV, ideal untuk 6–7 orang dengan bagasi cukup. Banyak disewakan harian dengan atau tanpa supir',
      openDays: 'Ready',
      openTime: 'rental perhari',
      ticketPrice: 'Rp  350.000/hari',
      fixedTotalPriceString: 'Rp 1050.000',
      imageAsset: 'images/avanza-g-white.png',
      imageUrls: [
        'images/avanza-g-white.png',
        'images/rinacita.jpg',
        'images/fermemint.jpg',
      ],
    ),
    startDate: DateTime(2025, 5, 10),
    endDate: DateTime(2025, 5, 12),
  ),
  Booking(
    place: TourismPlace(
      name: 'Honda Supra GTR 150',
      location: 'Bali',
      description: 'Motor rental yang nyaman untuk perjalanan di Bali.',
      openDays: 'Ready',
      openTime: 'rental perhari',
      ticketPrice: 'Rp 100.000 /hari',
      fixedTotalPriceString: 'Rp 500.000',
      imageAsset: 'images/Honda Supra GTR 150.jpg',
      imageUrls: [
        'images/Honda Supra GTR 150.jpg',
        'images/huanglong.png',
        'images/rinacita.jpg',
      ],
    ),
    startDate: DateTime(2025, 6, 1),
    endDate: DateTime(2025, 6, 5),
  ),
  Booking(
    place: TourismPlace(
      name: 'Toyota Hiace',
      location: 'bali',
      description:
          'Van besar untuk rombongan, kapasitas hingga 13 orang. Umum dipakai untuk tur grup besar baliholidaysecrets.com',
      openDays: 'Ready',
      openTime: 'rental perhari',
      ticketPrice: 'Rp 650.000/har',
      fixedTotalPriceString: 'Rp 1.950.000',
      imageAsset: 'images/Toyota Hiace.png',
      imageUrls: [
        'mages/Toyota Hiace.png',
        'images/rinacita.jpg',
        'images/fermemint.jpg',
      ],
    ),
    startDate: DateTime(2025, 4, 1),
    endDate: DateTime(2025, 4, 3),
  ),
];
