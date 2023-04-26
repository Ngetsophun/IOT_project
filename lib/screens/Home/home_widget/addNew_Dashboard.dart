import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iot_project/widgets/custom_AddNewDevice.dart';

class AddNewDashBoard extends StatefulWidget {
  const AddNewDashBoard({super.key});

  @override
  State<AddNewDashBoard> createState() => _AddNewDashBoardState();
}

class _AddNewDashBoardState extends State<AddNewDashBoard> {
  File? file;
  final ImagePicker Images = ImagePicker();

  List<File> _images = [];
  final picker = ImagePicker();

  late PickedFile _imgFile;
  final ImagePicker _picker = ImagePicker();

  late String chooseBoard = '0 = OFF';
  List ItemBoard = ['0 = OFF', '1 = ON'];

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
              // deviceRoom(),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonAddNewDevice(),
                    buttomSave(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: 70,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
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
                                  Text('GPIO: '),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(Icons.delete),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget imageRoom() {
    return Center(
      child: Stack(
        children: <Widget>[
          // CircleAvatar(
          //   radius: 80.0,
          //   backgroundColor: Colors.white60,
          //    backgroundImage: _imgFile == null? Icon(Icons.image):FileImage(File(_imgFile.path)),
          // ),
          Container(
              height: 150,
              width: 150,
              child: ClipOval(
                child: file == null
                    ? const Icon(Icons.image)
                    : Image.file(
                        file!,
                        fit: BoxFit.cover,
                      ),
                // _imgFile == null? const Icon(Icons.image):FileImage(File(_imgFile.path)),
              )),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () {
                  // showModalBottomSheet(
                  //     context: context, builder: ((build) => bottomsheet()));
                  getgallery();
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

  Widget buttomSave() {
    return Container(
      height: 50,
      width: 150,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Save', style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget ButtonAddNewDevice() {
    return Container(
      height: 50,
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: ((build) => CustomAddnewDevice()));
        },
        child: Text(
          'Add Device',
          style: TextStyle(fontSize: 16),
        ),
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

  getCamera() async {
    final imgCamera = await Images.getImage(source: ImageSource.camera);
    setState(() {
      file = File(imgCamera!.path);
    });
  }

  getgallery() async {
    final imgCamera = await Images.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(imgCamera!.path);
    });
  }
}
