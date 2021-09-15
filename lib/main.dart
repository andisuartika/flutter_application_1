import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'UI/home/homeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Flutter',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
      ),
      home: HomeScreen(),
    );
  }
}
