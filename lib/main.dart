import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovelove/login.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: login(),
    );
  }
}