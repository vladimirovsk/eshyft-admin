import 'package:eshyftadmin/screens/facilities.dart';
import 'package:eshyftadmin/screens/reports.dart';
import 'package:eshyftadmin/screens/settings.dart';
import 'package:eshyftadmin/screens/timecards.dart';
import 'package:eshyftadmin/screens/users.dart';
import 'package:flutter/material.dart';
import 'package:eshyftadmin/screens/start-page.dart';
import 'package:eshyftadmin/screens/dashboard.dart';
import 'package:eshyftadmin/screens/login.dart';

const titleAppBar = 'Eshyft Admin';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new AdminApp());
}

class AdminApp extends StatefulWidget {
  const AdminApp({super.key});

  @override
  _AdminAppScreen createState() => _AdminAppScreen();
}

class _AdminAppScreen extends State<AdminApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) =>  LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/start-page': (context) => StartPageScreen(),
        '/timecards': (context) => TimecadsScreen(),
        '/facilities': (context) => FacilitiesScreen(),
        '/users': (context) => UsersScreen(),
        '/reports': (context) => ReportsScreen(),
        '/settings': (context) => SettingScreen(),
      } ,
      initialRoute: '/start-page',
    );
  }
}
