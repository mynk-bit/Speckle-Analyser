import 'package:flutter/material.dart';
import '../utils/bottombar.dart';

class paraOptions extends StatefulWidget {
  paraOptions({Key? key}) : super(key: key);

  @override
  State<paraOptions> createState() => _paraOptionsState();
}

class _paraOptionsState extends State<paraOptions> {
  String selectval = 'Select';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E5EF),
      appBar: AppBar(
        title: Text('Parameters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'For visualizing laser Speckle Choose Images Gray or Cmap Choose appropriate frame delay and frame repeat. Filename to change the visualization can be entered below.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ///////////////// Image type dropdown/////////////////
              Row(
                children: [
                  Text(
                    'Image Type ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    value: selectval,
                    items: [
                      DropdownMenuItem(child: Text("Select"), value: "Select"),
                      DropdownMenuItem(child: Text("Cmap"), value: "Cmap"),
                      DropdownMenuItem(child: Text("Gray"), value: "Gray"),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectval = value.toString();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              //  INPUT METHOODS
              Row(
                children: [
                  Text(
                    'Frame Delay ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Repeat Delay',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Save As            ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
 
    );
  }
}
