import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemdetector/controller/app_controller.dart';
import 'package:gemdetector/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../utils/enum.dart';

class CameraScreen extends StatefulWidget {
  CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  AppController? appControllerProvider;

  @override
  initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    appControllerProvider = Provider.of(context, listen: true);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: AppColors.primaryColor),
        child: appControllerProvider!.imageCamera != null
            ? Image.file(
                appControllerProvider!.imageCamera!,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.fitHeight,
              )
            : Stack(
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
                child:   Lottie.asset('assets/lottie/cameraAnimation.json',height: 250,width: 300),
              )
            ]),
      ),
    );
  }
}
