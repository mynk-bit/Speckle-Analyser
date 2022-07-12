import 'package:flutter/material.dart';
import 'package:speckle_analyser/Pages/visualize_screen.dart';
import '../utils/bottombar.dart';

class ProcessImage extends StatefulWidget {
  final methodImage;
  final String methodname;
  const ProcessImage({Key? key, this.methodImage, required this.methodname})
      : super(key: key);
  @override
  State<ProcessImage> createState() => _ProcessImageState();
}

class _ProcessImageState extends State<ProcessImage> {
  @override
  int _imageReady = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(widget.methodname.toUpperCase()))),
        body: Container(
            child: Center(
          child: Image.network('https://speckle-analyser-backend.herokuapp.com/images/'+widget.methodImage),
        )),
        bottomNavigationBar: myBottombar(),
        );
  }
}
