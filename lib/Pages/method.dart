import 'package:flutter/material.dart';
import 'package:speckle_analyser/utils/square.dart';

class anaMethods extends StatefulWidget {
  anaMethods({Key? key}) : super(key: key);

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
    'Std Dev',
  ];
  var _selectedidx = -1;

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
    
    );
  }
}
