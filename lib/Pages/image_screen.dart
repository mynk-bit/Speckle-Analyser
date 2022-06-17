import 'dart:io';
import 'package:flutter/material.dart';
import 'package:speckle_analyser/Pages/visualize_screen.dart';
import 'home.dart';

class imagePage extends StatefulWidget {
  final pickedImage;
  const imagePage({Key? key, this.pickedImage}) : super(key: key);
  @override
  State<imagePage> createState() => _imagePageState();
}

class _imagePageState extends State<imagePage> {
  void _nextPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => methodPage(
                  visImage: widget.pickedImage,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Image Screen")),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: [
            Image.file(
              widget.pickedImage,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 200),
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () => _nextPage(),
                    child: Icon(
                      Icons.check,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
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
      )),
    );
  }
}
