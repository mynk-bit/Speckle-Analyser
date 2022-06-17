import 'package:flutter/material.dart';
import 'package:speckle_analyser/utils/square.dart';

class anaMethods extends StatefulWidget {
  anaMethods({Key? key}) : super(key: key);

  @override
  State<anaMethods> createState() => _anaMethodsState();
}

class _anaMethodsState extends State<anaMethods> {
  var kolor = Colors.white;
  final List _post = [
    'Fujii',
    'GD',
    'LASCA',
    'PCA',
    'pixelSVD',
    'specPatch',
    'Mean',
    'Std Dev',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE7E5EF),
        appBar: AppBar(title: Text('Analysis Methods')),
        body: ListView.builder(
            itemCount: _post.length,
            itemBuilder: (context, index) {
              return Container(
                color: kolor,
                child: ListTile(
                  title: Text(_post[index]),
                  onTap: () {
                    setState(() {
                      kolor = Color(0xFF8167D7);
                    });
                  },
                ),
              );
            }));
  }
}
