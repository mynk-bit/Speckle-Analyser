import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speckle_analyser/Pages/image_screen.dart';
import '../utils/bottombar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? pickedImage;
  File? pickedImage2;
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  _pickImage(ImageSource imageType) async {
    try {
      List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
      setState(() {
        if (selectedImages!.isNotEmpty) {
          imageFileList = selectedImages;
        }
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => imagePage(
                    pickedImage: imageFileList,
                  )));

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  _pickCamera(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => imagePage(
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
          Image(
            image: AssetImage('assets/images/homenav.png'),
             fit: BoxFit.cover,
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
                    'Upload Image from your Local Dirctory',
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
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
        child: Row(
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () => _pickCamera(ImageSource.camera),
              child: Icon(Icons.camera),
            ),
            Spacer(),
            FloatingActionButton(
              heroTag: null,
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Icon(Icons.upload),
            ),
          ],
        ),
      ),
      bottomNavigationBar: myBottombar(),
    );
  }
}
