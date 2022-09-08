
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          alignment: Alignment.center,
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Image(image: AssetImage(
                'assets/images/bg.png',
              ),
                fit: BoxFit.fill,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(33.0),
              child: Center(child: Lottie.asset('assets/lottie/whiteAnimation.json',height: 240,width: 190)),
            )
          ]),
    );
  }
}
