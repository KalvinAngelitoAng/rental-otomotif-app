MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const LoginPage(),
    '/dashboard': (context) => const DashboardPage(),
    '/motor_listrik': (context) => const MotorListrikPage(),
    '/motor_matic': (context) => const MotorMaticPage(),
    '/motor_manual': (context) => const MotorManualPage(),
    '/mobil_matic': (context) => const MobilMaticPage(),
    '/elf': (context) => const ElfPage(),
    '/pickup': (context) => const PickupPage(),
    '/profile_page': (context) => const ProfilePage(),
    '/booking_form_page': (context) => const BookingFormPage(),
  },
)
