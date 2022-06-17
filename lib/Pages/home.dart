import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speckle_analyser/Pages/image_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? pickedImage;

  _pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      // setState(() {
      //   pickedImage = tempImage;
      // });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => imagePage(
            pickedImage: tempImage,
          )));

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E5EF),
      body: Center(
          child: ListView(
        children: [
          SvgPicture.asset(
            'assets/images/homenav.svg',
          ),
          SvgPicture.asset(
            'assets/images/undraw.svg',
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Choose Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Select Camera to Capture Image',
                    style: TextStyle(
                      fontSize: 20,
                      wordSpacing: 2,
                      color: Color.fromRGBO(0, 0, 0, 4.6),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(0, 0, 0, 4.6),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Attach Image from your Local Dirctory',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 4.6),
                      fontSize: 20,
                      wordSpacing: 2,
                    ),
                  ),
                ],
              )),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 100),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: Icon(Icons.camera),
            ),
            Spacer(),
            FloatingActionButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Icon(Icons.upload),
            ),
          ],
        ),
      ),
    );
  }
}
