import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemdetector/controller/app_controller.dart';
import 'package:gemdetector/utils/colors.dart';
import 'package:gemdetector/utils/strings.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../utils/constant.dart';

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
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: const BoxDecoration(color: AppColors.primaryColor),
        child: appControllerProvider!.imageCamera != null ?
        Stack(
          alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                  child: Image.file(
                    appControllerProvider!.imageCamera!,
                    width: MediaQuery.of(context).size.height,
                    height: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitHeight,
                    color: Colors.white.withOpacity(0.3), colorBlendMode: BlendMode.modulate,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(33.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(finalSplitted,style: const TextStyle(color: AppColors.white,fontSize:22,fontWeight: FontWeight.bold
                    ),),
                    Lottie.asset(
                        'assets/lottie/diamondAnimation.json', height: 250,
                        width: 300),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible( 
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(AppStrings.warning,style: TextStyle(color: AppColors.red,fontSize:16,fontWeight: FontWeight.bold
                              ),),
                              Text(AppStrings.warning1,style: TextStyle(color: AppColors.red,fontSize:18,fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ])
            : Stack(
            alignment: Alignment.center,
            children: <Widget>[
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                child: Image(image: const AssetImage(
                  'assets/images/bg.png',
                ),
                  fit: BoxFit.fill, width: MediaQuery
                      .of(context)
                      .size
                      .width, height: MediaQuery
                      .of(context)
                      .size
                      .height,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(33.0),
                child: Lottie.asset(
                    'assets/lottie/cameraAnimation.json', height: 250,
                    width: 300),
              )
            ]),
      ),
    );
  }
}
