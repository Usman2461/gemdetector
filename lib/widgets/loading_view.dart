import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {

  timer(){
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pop();
    });
  }

  @override
  void initState() {
    timer();// TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          alignment: Alignment.center,
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Image(image: const AssetImage(
                'assets/images/bg1.png',
              ),
                fit: BoxFit.fill,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(33.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lottie/whiteAnimation.json',height: 240,width: 190),
                  Text("Loading...",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ]),
    );
  }
}
