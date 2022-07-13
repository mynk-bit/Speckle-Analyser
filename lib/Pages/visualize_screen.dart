import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speckle_analyser/Pages/parameter.dart';
import 'method.dart';

class methodPage extends StatefulWidget {
  var visImage;
  methodPage({Key? key, this.visImage}) : super(key: key);

  @override
  State<methodPage> createState() => _methodPageState();
}

class _methodPageState extends State<methodPage> {
  void _methods() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => anaMethods(
                  methodImage: widget.visImage,
                )));
  }

  void _paraoptions() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => paraOptions()));
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.visImage);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Visualization'))),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            for (XFile image in widget.visImage)
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
            child: SizedBox.fromSize(
              size: Size(80, 80),
              child: ClipOval(
                child: Material(
                  color: Color(0xFF8167D7),
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () => _methods(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.analytics,
                          color: Colors.white,
                        ), // <-- Icon
                        Text(
                          "Analysis",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ), // <-- Text
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              right: 30,
              child: SizedBox.fromSize(
                size: Size(80, 80),
                child: ClipOval(
                  child: Material(
                    color: Color(0xFF8167D7),
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: ()=> _paraoptions(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.select_all,
                          color: Colors.white,
                          ), // <-- Icon
                          Text("Parameters",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          ), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
