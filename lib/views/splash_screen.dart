import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      navigateToHomeScreen();
    });
  }
  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const NotesView()), // Replace with the screen you want to navigate to
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      // backgroundColor: Color.fromRGBO(240, 190, 20, 1),
      body: Center(child: CircleAvatar(
        radius: 75,
        backgroundImage: AssetImage('assets/images/fe.gif') ,)
      // Image.asset('assets/images/e.gif')
      ,)
    ,);
  }
}
