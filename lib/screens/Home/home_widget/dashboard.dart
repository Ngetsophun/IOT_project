import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:iot_project/modelData/dashboardModel.dart';
import 'package:iot_project/screens/Home/home_widget/addNew_Dashboard.dart';
import 'package:iot_project/screens/navigation_Bar/account.dart';
import 'package:iot_project/screens/navigation_Bar/recent.dart';
import 'package:iot_project/screens/navigation_Bar/search.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool onchange = false;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //   items: items,
      //   index: index,
      //   onTap: (seletedIndex) {
      //     setState(() {
      //       index = seletedIndex;
      //     });
      //   },
      //   // backgroundColor: Colors.transparent,
      // ),
      body: Container(
        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFFfce2e1), Colors.white]),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "DASHBOARD",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFFfce2e1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewDashBoard()));
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: dashboardDatalist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    DashBoard dashBoard = dashboardDatalist[index];
                    return GestureDetector(
                      onTap: () {
                        print(dashBoard.name);
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(10)),
                            Container(
                              child: Text(
                                dashBoard.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              child: Image.asset(dashBoard.icons),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              dashBoard.device + ' Device',
                              style: TextStyle(color: Colors.black26),
                            ),
                            Transform.scale(
                              alignment: Alignment.bottomRight,
                              scaleX: 0.8,
                              scaleY: 0.85,
                              child: Switch.adaptive(
                                  value: onchange,
                                  activeColor: onchange
                                      ? Colors.green.withOpacity(0.4)
                                      : Colors.black,
                                  // trackColor: Colors.black,
                                  onChanged: (bool value) {
                                    setState(() {
                                      onchange = value;
                                    });
                                  }),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
}
