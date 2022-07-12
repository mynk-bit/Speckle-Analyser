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
  // static File get pickedImage => pickedImage;
  void _nextPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => methodPage(
                  visImage: widget.pickedImage,
                )));
  }

  // Future<void> _imagesize() async {
  //   //  print("Pixel color is: ${widget.pickedImage.pixelColorAt(0.9,0.2)}.");
  //   List<List<double>> frame = [];
  //   var H, W;
  //   for (XFile image in widget.pickedImage) {
  //     var img = Img.decodeBmp(File(image.path).readAsBytesSync())!;
  //     H = img.height;
  //     W = img.width;
  //     //  print(img.getBytes().length);

  //     frame.add(img
  //         .getBytes(format: Img.Format.rgb)
  //         .map((e) => e.toDouble())
  //         .toList());
  //   }
  //   print(frame[0].length);

  //   //fujji

  //   Mat.Matrix F1 = Mat.Matrix.fromList(frame.sublist(1));
  //   // print(F1[0].length);
  //   Mat.Matrix F2 = Mat.Matrix.fromList(frame.sublist(0, frame.length - 1));
  //   // print(F2[0].length);
  //   Mat.Matrix F3 = (F1 - F2).pow(2).pow(0.5);
  //   // print(F3[0].length);
  //   Mat.Matrix F4 = (F1 + F2) + 0.0000000001;
  //   // print(F4[0].length);
  //   Mat.Matrix F = F3 / F4;
  //   // print(F[0].length);
  //   Mat.Vector M = F.mean(Mat.Axis.columns);
  //   // List<num> tmp = [];
  //   // for (var i = 0; i < F.length; i++) tmp.add(1);
  //   // Vector M = Vector.fromList(tmp);
  //   // F = (F * M) / F.length;
  //   M = M * 200;
  //   // M.cast<int>();
  //   // print(M);
  //   Uint8List temp = Uint8List.fromList(M.map((e) => e.floor()).toList());
  //   finalImage = widget.pickedImage;
  //   //print(temp);
  //   // print(temp.length);

  //   // Bitmap bitmap = Bitmap.fromHeadless(W, H, temp);
  //   // setState(() {
  //   //   finalImage = bitmap.buildHeaded();
  //   // });
  //   // print('last1\n');
  //   // print(frame.length);
  //   // nd.Array2d F1 = nd.Array2d(frame.sublist(1));
  //   // print('last2\n');
  //   // nd.Array2d F2 = nd.Array2d(frame.sublist(0, frame.length - 1));
  //   // print('last3\n');
  //   // print(F1.length);
  //   // F1.map((element) => print(element));
  //   // print('last map');
  //   // nd.Array2d F3 = (F1 - F2);
  //   // //     .map((nd.Array x) => nd.Array(x.map((double y) => y.abs()).toList()))
  //   // //     .toList());
  //   // // print('last4\n');
  //   // print(F2.length);
  //   // nd.array2dMultiplyToScalar(F2, -1);
  //   // nd.Array2d F4 = F1 - F2;

  //   // print('last5\n');
  //   // print(F3.length);
  //   // print(F4.length);
  //   // print(F3);
  //   // nd.array2dAddToScalar(F4, 0.0000000001);
  //   // print(F4);
  //   // nd.Array2d F = F3 / F4;
  //   // print('last6\n');
  //   // print(F);
  //   // List<int> last =
  //   //     F.map((element) => (nd.mean(element) * 200).floor()).toList();

  //   // print('last7\n');
  //   // print(last);
  //   // finalImage = Img.decodeBmp(last);

  //   // List<List> F = [];
  //   // for (var i = 0; i < frame.sublist(1).length; i++) {
  //   //   List tmp = [];
  //   //   for (var j = 0; j < frame.sublist(1)[i].length; j++) {
  //   //     tmp.add(
  //   //         (frame.sublist(1)[i][j] - frame.sublist(0, frame.length - 1)[i][j])
  //   //                 .abs() /
  //   //             (frame.sublist(1)[i][j] +
  //   //                 frame.sublist(0, frame.length - 1)[i][j]));
  //   //   }
  //   //   F.add(tmp);
  //   // }

  //   //     (frame.sublist(1) - frame.sublist(0, frame.length - 1)).abs() /
  //   //         (frame.sublist(1) + frame.sublist(0, frame.length - 1));

  //   // final bytes = await widget.pickedImage!.readAsBytes();
  //   // final decoder = Imagi.BmpDecoder();
  //   // final decodedImg = decoder.decodeImage(bytes);
  //   // final decodedBytes = decodedImg!.getBytes(format: Imagi.Format.rgb);

  //   // List<List<List<int>>> imgArr = [];
  //   // for (int y = 0; y < decodedImg.height; y++) {
  //   //   imgArr.add([]);
  //   //   for (int x = 0; x < decodedImg.width; x++) {
  //   //     int red = decodedBytes[y * decodedImg.width * 3 + x * 3];
  //   //     int green = decodedBytes[y * decodedImg.width * 3 + x * 3 + 1];
  //   //     int blue = decodedBytes[y * decodedImg.width * 3 + x * 3 + 2];
  //   //     imgArr[y].add([red, green, blue]);
  //   //   }
  //   // }
  //   // print('Image height ${decodedImg.height}');
  //   // print('Image width ${decodedImg.width}');
  //   // print(imgArr);
  //   // // print(imgArr.length);

  //   // var mx=0, mn=300;
  //   // for (int y = 0; y < decodedImg.height; y++) {
  //   //   for (int x = 0; x < decodedImg.width; x++) {
  //   //     for (int i = 0; i < 2; i++) {

  //   //       if (imgArr[y][x][i]!= null){
  //   //           if(imgArr[y][x][i] > mx)
  //   //                  mx = imgArr[x][y][i];
  //   //           if(imgArr[y][x][i] <256 && imgArr[y][x][i] < mn)
  //   //                  mn = imgArr[x][y][i];
  //   //       }

  //   //       //  if (imgArr[y][x][i]!= null && imgArr[y][x][i] < mn) mn = imgArr[x][y][i];
  //   //     }
  //   //   }
  //   // }
  //   // print('maximum value ${mx}');
  //   // print('minimum value ${mn}');

  //   //   // try {
  //   //   //   File image = widget.pickedImage; // Or any other way to get a File instance.
  //   //   //   var decodedImage = await decodeImageFromList(image.readAsBytesSync());
  //   //   //   print('image width ${decodedImage.width}');
  //   //   //   print(' image height ${decodedImage.height}');

  //   //   // } catch (error) {
  //   //   //       print(error);
  //   //   // }
  // }

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
