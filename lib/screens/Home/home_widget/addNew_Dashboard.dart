import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewDashBoard extends StatefulWidget {
  const AddNewDashBoard({super.key});

  @override
  State<AddNewDashBoard> createState() => _AddNewDashBoardState();
}

class _AddNewDashBoardState extends State<AddNewDashBoard> {
  late PickedFile _imgFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Add new Dashboard',
        style: TextStyle(),
      )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFFfce2e1), Colors.white]),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              imageRoom(),
              SizedBox(
                height: 10,
              ),
              nameRoom(),
              SizedBox(
                height: 10,
              ),
              deviceRoom(),
              SizedBox(
                height: 10,
              ),
              buttomSave(),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageRoom() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.white60,
            // backgroundImage: _imgFile != null?null
            //     : FileImage(File(_imgFile.path)),
           
           
          ),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((build) => bottomsheet()));
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                  size: 28.0,
                ),
              ))
        ],
      ),
    );
  }

  Widget nameRoom() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Name Room',
        prefixIcon: Icon(
          Icons.playlist_add_circle_sharp,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget deviceRoom() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Device Room',
        prefixIcon: Icon(
          Icons.room_preferences,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buttomSave() {
    return Container(
      height: 50,
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Save'),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imgFile != pickedFile;
    });
  }

  Widget bottomsheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose Room photo',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text('Camera')),
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text('Gallery')),
            ],
          )
        ],
      ),
    );
  }
}
