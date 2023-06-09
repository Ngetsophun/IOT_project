import 'package:flutter/material.dart';

class CustomAddnewDevice extends StatefulWidget {
  const CustomAddnewDevice({super.key});

  @override
  State<CustomAddnewDevice> createState() => _CustomAddnewDeviceState();
}

class _CustomAddnewDeviceState extends State<CustomAddnewDevice> {
  late String chooseBoard = '0 = OFF';
  List ItemBoard = ['0 = OFF', '1 = ON'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
              child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name Device',
              prefixIcon: Icon(
                Icons.playlist_add_circle_sharp,
                color: Colors.black,
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Container(
              child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Board ID',
              prefixIcon: Icon(
                Icons.playlist_add_circle_sharp,
                color: Colors.black,
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Container(
              child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'GPIO Number',
              prefixIcon: Icon(
                Icons.playlist_add_circle_sharp,
                color: Colors.black,
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Container(
              child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              suffixIcon: DropdownButtonFormField(
                value: chooseBoard,
                onChanged: (item) {
                  setState(() {
                    chooseBoard = item!;
                  });
                },
                items: ItemBoard.map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    )).toList(),
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 150,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Create',
                  style: TextStyle(fontSize: 16),
                )),
          )
        ],
      ),
    );
  }
}
