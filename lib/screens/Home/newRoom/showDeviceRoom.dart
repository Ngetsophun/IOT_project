import 'package:flutter/material.dart';

class ShowDeviceRoom extends StatefulWidget {
  const ShowDeviceRoom({super.key});

  @override
  State<ShowDeviceRoom> createState() => _ShowDeviceRoomState();
}

class _ShowDeviceRoomState extends State<ShowDeviceRoom> {
  bool onchange = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show '),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Name Device',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Board',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
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
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
