import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';

void main() {
  runApp(MaterialApp(
    home: TransportFilterPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class TransportFilterPage extends StatefulWidget {
  @override
  State<TransportFilterPage> createState() => _TransportFilterPageState();
}

class _TransportFilterPageState extends State<TransportFilterPage> {
  DateTime? fromDate, toDate;
  TextEditingController addressController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController pricePerDayController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();

  Map<String, int> vehiclePrices = {
    "Isuzu Elf": 800000,
    "Toyota Innova Zenix": 450000,
    "Viar EV1 electric scooter": 150000,
    "Honda Vario 125": 120000,
    "Mitsubishi L300": 400000,
  };

  List<String> vehicleTypes = [];
  String? selectedVehicleType;

  List<String> fuelTypes = ["Petrol", "Diesel", "Electric", "Hybrid"];
  List<String> selectedFuels = [];

  List<String> features = ["AC", "GPS", "Bluetooth"];
  List<String> selectedFeatures = [];

  int totalPrice = 0;

  final NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

  @override
  void initState() {
    super.initState();
    vehicleTypes = vehiclePrices.keys.toList();
  }

  void resetAll() {
    setState(() {
      fromDate = null;
      toDate = null;
      addressController.clear();
      fromController.clear();
      toController.clear();
      selectedVehicleType = null;
      selectedFuels.clear();
      selectedFeatures.clear();
      totalPrice = 0;
      vehicleNameController.clear();
      pricePerDayController.clear();
      totalPriceController.clear();
    });
  }

  void calculateTotalPrice() {
    if (fromDate != null && toDate != null && selectedVehicleType != null) {
      final days = toDate!.difference(fromDate!).inDays;
      final pricePerDay = vehiclePrices[selectedVehicleType] ?? 0;
      totalPrice = (days > 0 ? days : 0) * pricePerDay;

      vehicleNameController.text = selectedVehicleType!;
      pricePerDayController.text = currencyFormat.format(pricePerDay);
      totalPriceController.text = currencyFormat.format(totalPrice);
    }
  }

  void showBookingSuccess() {
    if (addressController.text.isNotEmpty &&
        fromDate != null &&
        toDate != null &&
        selectedVehicleType != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Sukses"),
          content: Text("Booking berhasil"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mohon lengkapi semua data terlebih dahulu")),
      );
    }
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    addressController.dispose();
    vehicleNameController.dispose();
    pricePerDayController.dispose();
    totalPriceController.dispose();
    super.dispose();
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: const Color.fromARGB(255, 148, 5, 5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 139, 8, 8),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => DashboardPage()),
            );
          },
        ),
        title: Text("BookingKuy", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: resetAll,
                    child: Text(
                      "Reset all",
                      style:
                          TextStyle(color: const Color.fromARGB(255, 157, 19, 9)),
                    ),
                  ),
                ],
              ),

              buildSectionTitle("Alamat"),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: "Masukkan alamat lengkap",
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),

              buildSectionTitle("Periode Sewa"),
              Row(children: [
                Expanded(
                  child: TextField(
                    controller: fromController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "From",
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    onTap: () async {
                      fromDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (fromDate != null) {
                        fromController.text =
                            "${fromDate!.day}/${fromDate!.month}/${fromDate!.year}";
                        calculateTotalPrice();
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: toController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "To",
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    onTap: () async {
                      toDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (toDate != null) {
                        toController.text =
                            "${toDate!.day}/${toDate!.month}/${toDate!.year}";
                        calculateTotalPrice();
                      }
                    },
                  ),
                ),
              ]),

              buildSectionTitle("Kendaraan"),
              Column(
                children: vehicleTypes.map((type) {
                  return RadioListTile<String>(
                    title: Text(
                        "$type (${currencyFormat.format(vehiclePrices[type])}/hari)"),
                    value: type,
                    groupValue: selectedVehicleType,
                    onChanged: (val) {
                      setState(() {
                        selectedVehicleType = val;
                        calculateTotalPrice();
                      });
                    },
                  );
                }).toList(),
              ),

              buildSectionTitle("Total Pembayaran"),
              TextField(
                controller: vehicleNameController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Nama Kendaraan",
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: pricePerDayController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Harga Per Hari",
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: totalPriceController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Total Harga",
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),

              buildSectionTitle("Bahan Bakar"),
              Wrap(
                spacing: 10,
                children: fuelTypes.map((type) {
                  final selected = selectedFuels.contains(type);
                  return ChoiceChip(
                    label: Text(type),
                    selected: selected,
                    selectedColor: Colors.grey[300],
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          selectedFuels.add(type);
                        } else {
                          selectedFuels.remove(type);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              buildSectionTitle("Fitur"),
              Wrap(
                spacing: 10,
                children: features.map((feature) {
                  final selected = selectedFeatures.contains(feature);
                  return ChoiceChip(
                    label: Text(
                      feature,
                      style: TextStyle(
                        color: selected
                            ? Colors.white
                            : const Color.fromARGB(255, 142, 18, 9),
                      ),
                    ),
                    selected: selected,
                    selectedColor: const Color.fromARGB(255, 136, 14, 5),
                    backgroundColor:
                        const Color.fromARGB(255, 151, 18, 9).withOpacity(0.1),
                    onSelected: (val) {
                      setState(() {
                        if (val) {
                          selectedFeatures.add(feature);
                        } else {
                          selectedFeatures.remove(feature);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: showBookingSuccess,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 128, 15, 7),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text("Book Now",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
