import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/screens/navigation_Bar/Account/profile.dart';
import 'package:iot_project/screens/navigation_Bar/recent.dart';
import 'package:iot_project/screens/navigation_Bar/search.dart';

import '../Home/home_widget/dashboard.dart';


class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({super.key});

  @override
  State<BottomAppBarScreen> createState() => _BottomAppBarScreenState();
}

class _BottomAppBarScreenState extends State<BottomAppBarScreen> {
  final items = [
    Icon(Icons.home),
    Icon(Icons.recent_actors_rounded),
    Icon(Icons.notifications_active),
    Icon(Icons.person),
  ];

  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (seletedIndex) {
          setState(() {
            index = seletedIndex;
          });
        },
        // backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: SelectNavigationBar(index: index),
      ),
    );
  }

  Widget SelectNavigationBar({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = DashBoardScreen();
        break;
      case 1:
        widget = RecentScreen();
        break;
      case 2:
        widget = SearchScreen();
        break;
      case 3:
        widget = ProfileScreen();
        break;
      default:
        widget = DashBoardScreen();
        break;
    }
    return widget;
  }
}
