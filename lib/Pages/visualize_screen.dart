import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speckle_analyser/Pages/parameter.dart';
import 'method.dart';

class methodPage extends StatefulWidget {
  final visImage;
  methodPage({Key? key, this.visImage}) : super(key: key);

  @override
  State<methodPage> createState() => _methodPageState();
}

class _methodPageState extends State<methodPage> {
  void _methods() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => anaMethods()));
  }

  void _paraoptions() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => paraOptions()));
  }

  @override
  Widget build(BuildContext context) {
    print(widget.visImage);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Visualization'))),
      body: Container(
           child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              for(XFile image in widget.visImage)
              Stack(
                children: [
                  Image.file(
                    File(image.path),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                ],
              )
            ],
           ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'back',
              onPressed: () => _methods(),
              child: const Icon(
                Icons.arrow_left,
                size: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: FloatingActionButton(
              heroTag: 'next',
              onPressed: () => _paraoptions(),
              child: const Icon(
                Icons.arrow_right,
                size: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
