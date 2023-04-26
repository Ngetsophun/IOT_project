import 'package:flutter/material.dart';
import 'package:iot_project/screens/Home/home_widget/dashboard.dart';
import 'package:iot_project/screens/login_screen/forgot.dart';
import 'package:iot_project/screens/login_screen/login.dart';
import 'package:iot_project/screens/navigation_Bar/bottom_bar.dart';
import 'package:iot_project/screens/navigation_Bar/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DashBoardScreen(),
      home: BottomAppBarScreen(),
    );
  }
}
