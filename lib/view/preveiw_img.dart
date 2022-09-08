
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../controller/app_controller.dart';
import '../utils/colors.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);


  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
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
        child: appControllerProvider!.imageGallery != null
            ? Image.file(
          appControllerProvider!.imageGallery!,
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
                child:   Lottie.asset('assets/lottie/galleryAnimation.json',height: 390,width: 350),
              )
            ]),
      ),
    );
  }
}