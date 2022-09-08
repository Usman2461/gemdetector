import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gemdetector/view/bottom_navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/images/splashscreen.png",fit: BoxFit.fill,),
      ),
    );
  }
  startTime() async {
    var duration =  const Duration(seconds: 2);
    return  Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigationScreen()),
    );
  }
}
