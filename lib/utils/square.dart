import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  final child;
  const MySquare({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
      child: Container(
        height: 100,
        color: Color(0xFF8167D7),
        child: Center(
          child: Text(
            child,
            style: TextStyle(
              fontSize: 35,
            ),
          ),
          
        ),
      ),
    );
  }
}
