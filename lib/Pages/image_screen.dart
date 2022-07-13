import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speckle_analyser/Pages/visualize_screen.dart';
import 'package:image/image.dart' as Img;
import 'dart:ui' as ui;
import '../utils/bottombar.dart';
// import 'package:ml_linalg/linalg.dart' as Mat;
// import 'package:bitmap/bitmap.dart';

class imagePage extends StatefulWidget {
  final pickedImage;
  const imagePage({Key? key, this.pickedImage}) : super(key: key);
  @override
  State<imagePage> createState() => _imagePageState();
}

class _imagePageState extends State<imagePage> {
  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
      Navigator.of(context).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => methodPage(
                      visImage: widget.pickedImage,
                    )));
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("From Given Data set",
      style: TextStyle(
           fontWeight: FontWeight.bold,
      ),
      ),
      content: Text("Fuji and Lasca show the most promising results",
      style: TextStyle(
        fontSize: 17,
      ),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _nextPage() {
    showAlertDialog(context);
    
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Image Screen")),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            for (XFile image in widget.pickedImage)
              Stack(
                children: [
                  Image.file(
                    File(image.path),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 200),
                    child: Row(
                      children: [
                        FloatingActionButton(
                          heroTag: "right",
                          onPressed: () => _nextPage(),
                          child: Icon(
                            Icons.check,
                          ),
                        ),
                        Spacer(),
                        FloatingActionButton(
                          heroTag: "cross",
                          onPressed: () {
                            print("cross");
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.cancel,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      )),
      bottomNavigationBar: myBottombar(),
    );
  }
}
