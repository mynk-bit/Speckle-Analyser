import 'package:flutter/material.dart';
import 'package:speckle_analyser/Pages/porcess_image.dart';
import '../utils/bottombar.dart';
import 'package:http/http.dart' as http;

class anaMethods extends StatefulWidget {
  var methodImage;
  anaMethods({Key? key, this.methodImage}) : super(key: key);

  @override
  State<anaMethods> createState() => _anaMethodsState();
}

class _anaMethodsState extends State<anaMethods> {
  var kolor = Color(0xFF8167D7);
  final List _post = [
    'Fujii',
    'GD',
    'LASCA',
    'PCA',
    'pixelSVD',
    'specPatch',
    'Mean',
    'Standard Deviation',
  ];
  var _selectedidx = -1;
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  UploadImage({String methodname = 'fujji'}) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://speckle-analyser-backend.herokuapp.com/process?method=' +
                methodname));
    for (int i = 0; i < widget.methodImage.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(
          'image', widget.methodImage[i].path));
    }

    print("inside upload image");
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    // showLoaderDialog(context);
    if (response.statusCode == 200) {
      var methodImage = await response.stream.bytesToString();
      print(methodImage);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProcessImage(
                    methodImage: methodImage,
                    methodname: methodname,
                  )));
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E5EF),
      appBar: AppBar(title: Text('Analysis Methods')),
      body: ListView.builder(
        itemCount: _post.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedidx = index;
                });
                print("images");
                UploadImage(methodname: _post[index].toString().toLowerCase());
              },
              child: SizedBox(
                height: 100,
                child: Card(
                  color: (index == _selectedidx)
                      ? Color(0xFF8167D7)
                      : Colors.white,
                  child: ListTile(
                    title: Center(
                        child: Text(
                      _post[index],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: myBottombar(),
    );
  }
}
