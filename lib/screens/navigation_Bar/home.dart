import 'package:flutter/material.dart';
import 'package:iot_project/screens/navigation_Bar/account.dart';
import 'package:iot_project/screens/navigation_Bar/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    MyAccount(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
       child: currentScreen,
       bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.add),
      
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
