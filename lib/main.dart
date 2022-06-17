import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speckle_analyser/Pages/splash.dart';

void main() {
  runApp(const MyApp());
}

const MaterialColor kPrimaryColor = const MaterialColor(
0xFF8167D7,
const <int, Color>{
50: const Color(0xFF8167D7),
100: const Color(0xFF8167D7),
200: const Color(0xFF8167D7),
300: const Color(0xFF8167D7),
400: const Color(0xFF8167D7),
500: const Color(0xFF8167D7),
600: const Color(0xFF8167D7),
700: const Color(0xFF8167D7),
800: const Color(0xFF8167D7),
900: const Color(0xFFFFFFFF),
},
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speckle analyser',
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        fontFamily: GoogleFonts.mukta().fontFamily
      ),
      home: splash(),
    );
  }
}

