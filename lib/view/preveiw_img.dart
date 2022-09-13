import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../controller/app_controller.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/strings.dart';
import '../widgets/loading_view.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  AppController? appControllerProvider;

  final _random = Random();
  var stringResult;

  getRndomString() {
    stringResult = attributives[_random.nextInt(attributives.length)];
  }

  startTime() async {
    var duration =  const Duration(microseconds: 0);
    return  Timer(duration, getLoading);
  }



  getLoading()  {
    if (appControllerProvider!.imageGallery != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoadingView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    appControllerProvider = Provider.of(context, listen: true);
    getRndomString();
    startTime();
    print("element");
    print(stringResult);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: AppColors.primaryColor),
        child: appControllerProvider!.imageGallery != null
            ? Stack(alignment: Alignment.center, children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0),
                    child: Image.file(
                      appControllerProvider!.imageGallery!,
                      width: MediaQuery.of(context).size.height,
                      height: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitHeight,
                      color: Colors.white.withOpacity(0.3),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(33.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stringResult,
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Lottie.asset('assets/lottie/diamondAnimation.json',
                    height: 250, width: 300),
                stringResult == AppStrings.gemstoneFake
                    ? Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            AppStrings.warning,
                            style: TextStyle(
                                color: AppColors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            AppStrings.warning1,
                            style: TextStyle(
                                color: AppColors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                    : SizedBox(),
              ],
            ),
          )
              ])
            : Stack(alignment: Alignment.center, children: <Widget>[
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                  child: Image(
                    image: const AssetImage(
                      'assets/images/bg.png',
                    ),
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(33.0),
                  child: Lottie.asset('assets/lottie/galleryAnimation.json',
                      height: 390, width: 350),
                )
              ]),
      ),
    );
  }
}
