import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;

class CheckPage extends StatefulWidget {
  // const CheckPage({Key key}) : super(key: key);

  @override
  _CheckPageState createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  bool _showProcessed = false;
  img.Image? _image;
  ui.Image? _uiImage;

  Future<void> loadImage() async {
    print('Mayank load 1');
    ByteData data = await rootBundle.load('assets/images/seed.jpg');
    _image = img.decodeJpg(data.buffer.asUint8List());
    if (_image != null) print('Mayank load 2');
  }

  img.Image processImage(img.Image image) {
    print('Mayank process Image');
    image = img.grayscale(image);
    return image;
  }

  Future<ui.Image> imgImageToUiImage(img.Image image) async {
    ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(
        image.getBytes(format: img.Format.rgba));
    print('Buffer _____________________ buffer');
    print(buffer.length);
    ui.ImageDescriptor id = ui.ImageDescriptor.raw(buffer,
        height: image.height,
        width: image.width,
        pixelFormat: ui.PixelFormat.rgba8888);
    ui.Codec codec = await id.instantiateCodec(
        targetHeight: image.height, targetWidth: image.width);
    ui.FrameInfo fi = await codec.getNextFrame();
    ui.Image uiImage = fi.image;
    return uiImage;
  }

  @override
  void initState() {
    print('Mayank in initSTate');
    super.initState();
    loadImage().then((value) {
      if (_image != null) {
        print("Mayank Not NUll");
        _image = processImage(_image!);
        imgImageToUiImage(_image!).then((value) {
          _uiImage = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('check Page'),
      ),
      body: Center(
          child: Column(children: [
        _showProcessed
            ? RawImage(image: _uiImage)
            : Image.asset('assets/images/seed.jpg'),
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (_showProcessed == false) {
                  _showProcessed = true;
                } else {
                  _showProcessed = false;
                }
              });
            },
            child: Text("Toggle"))
      ])),
    );
  }
}

// class CheckPage extends StatefulWidget {
//   const CheckPage({ Key? key }) : super(key: key);

//   @override
//   State<CheckPage> createState() => _CheckPageState();
// }

// class _CheckPageState extends State<CheckPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
       
//     );
//   }
// }