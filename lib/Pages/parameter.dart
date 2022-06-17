import 'package:flutter/material.dart';

class paraOptions extends StatefulWidget {
  paraOptions({Key? key}) : super(key: key);

  @override
  State<paraOptions> createState() => _paraOptionsState();
}

class _paraOptionsState extends State<paraOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE7E5EF),
        appBar: AppBar(
          title: Text('Parameters'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('For visualizing laser Speckle Choose Images Gray or Cmap Choose appropriate frame delay and frame repeat. Filename to change the visualization can be entered below.',
                  style: TextStyle(
                     fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
