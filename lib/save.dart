import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/data.dart';
import 'package:sharedpreference/key.dart';
import 'package:sharedpreference/loginScreen.dart';
import 'package:sharedpreference/splash.dart';
import 'package:sharedpreference/utils.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  Uint8List? _image;

  void selectedImage() async {
    List<int>? img = await pickImage(ImageSource.camera);

    if (img != null) {
      setState(() {
        _image = Uint8List.fromList(img);
      });
    }
  }

  void selectedImage2() async {
    List<int>? img = await pickImage(ImageSource.gallery);

    if (img != null) {
      setState(() {
        _image = Uint8List.fromList(img);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: () async {
                    var sharedPref = await SharedPreferences.getInstance();
                    sharedPref.setBool(SplashState.KEYLOGIN, false);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text("Logout"),
                ),
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 80,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 80,
                          child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHvZ0pbf4bXvAJgVZVuRQqrNWnoWl96cV6wQ&usqp=CAU'),
                        ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                height: 200,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        selectedImage();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        child: Text('Camera'),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        selectedImage2();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        child: Text('Gallery'),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        child: Text('Close'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
