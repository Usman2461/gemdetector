
import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemdetector/controller/app_controller.dart';
import 'package:gemdetector/utils/colors.dart';
import 'package:gemdetector/view/preveiw_img.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../test.dart';
import '../utils/enum.dart';
import 'camera_view.dart';
import 'drawer.dart';
 List<CameraDescription>? _cameras;
class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> with SingleTickerProviderStateMixin{
  int tabIndex = 0;

  // late TabController tabController = TabController(length: 3, vsync: this, initialIndex: tabIndex);
  //
  //
  //  getImageFromGallery()async{
  //   final pickedImage = await ImagePicker.platform.getImage(source: ImageSource.camera);
  //
  //   setState(() {
  //     if(pickedImage!=null){
  //       image1 = File(pickedImage.path);
  //     }
  //   });
  // }
  //
  // @override
  // void initState() {
  //   // loadCamera();
  //   super.initState();
  // }
  //
  // loadCamera() async {
  //   cameras = await availableCameras();
  //   if(cameras != null){
  //     controller = CameraController(cameras![0], ResolutionPreset.max);
  //     //cameras[0] = first camera, change to 1 to another camera
  //
  //     controller!.initialize().then((_) {
  //       if (!mounted) {
  //         return;
  //       }
  //       setState(() {});
  //     });
  //   }else{
  //     print("NO any camera found");
  //   }
  // }
  //
  //
  //
  // openCamera()async{
  //   if(tabIndex==1){
  //     print("abc");
  //     print(tabIndex);
  //     try {
  //       if(controller != null){ //check if contrller is not null
  //         if(controller!.value.isInitialized){ //check if controller is initialized
  //           image = await controller!.takePicture(); //capture image
  //           setState(() {
  //             //update UI
  //           });
  //         }
  //       }
  //     } catch (e) {
  //       print(e); //show error
  //     }
  //
  //   }
  //   else if(tabIndex==0&&tabIndex==2){
  //     controller?.dispose();
  //   }
  // }
  //
  bool clickedCentreFAB = false;

  static final List<Widget> _widgetOptions = [
    const DrawerScreen(),
    CameraScreen(),
    const GalleryScreen(),
  ];

  AppController? appControllerProvider;

  @override
  initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    appControllerProvider = Provider.of(context, listen: false);
    // appControllerProvider!.getCameraTypeAccess(tabIndex==2?ImageSource.gallery:null);
    return Scaffold(
        floatingActionButtonLocation: tabIndex==1?FloatingActionButtonLocation.centerFloat:FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: tabIndex==1?FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            appControllerProvider!.getCameraTypeAccess();
            setState(() {
              clickedCentreFAB = !clickedCentreFAB;
            });
          },
          tooltip: "Capture stone image",
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Icon(Icons.camera),
          ),
          elevation: 4.0,
        ):tabIndex==2?FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            appControllerProvider!.getGalleryAccess();
            setState(() {
              clickedCentreFAB = !clickedCentreFAB;
            });
          },
          tooltip: "Capture stone image",
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Icon(Icons.image_outlined),
          ),
          elevation: 4.0,
        ): SizedBox(),
      bottomNavigationBar: CurvedNavigationBar( height: 60,
        items: const <Widget>[
          Icon(Icons.menu,
              size: 30,
              color: Colors.white),
          Icon(Icons.camera_alt_outlined,
              size: 30, color: Colors.white),
          Icon(Icons.photo_library_outlined,
              size: 30,
              color: Colors.white),
        ],
        color: AppColors.primaryColor,
        // buttonBackgroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.navigationBgColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) async{
          // openCamera();
          setState(() {
            tabIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
        body: _widgetOptions.elementAt(tabIndex),
      // body: tabIndex==1?
      // GestureDetector(
      //   onTap: () async {
      //     XFile image = await imagePicker.pickImage(source: ImageSourceType.camera, imageQuality: 50,);
      //     setState(() {_image = File(image.path);});
      //   },
      //   child: Container(
      //     width: 200,
      //     height: 200,
      //     decoration: BoxDecoration(
      //         color: Colors.red[200]),
      //     child: _image != null
      //         ? Image.file(_image, width: 200.0, height: 200.0, fit: BoxFit.fitHeight,)
      //         : Container(decoration: BoxDecoration(color: Colors.red[200]), width: 200, height: 200, child: Icon(Icons.camera_alt, color: Colors.grey[800],),
      //     ),
      //   ),
      // )
      // :tabIndex==2?GestureDetector(
      //   onTap: () async {
      //     XFile image = await imagePicker.pickImage(source: ImageSourceType.gallery, imageQuality: 50);
      //     setState(() {_image = File(image.path);});
      //   },
      //   child: Container(
      //     width: 200,
      //     height: 200,
      //     decoration: BoxDecoration(
      //         color: Colors.red[200]),
      //     child: _image != null
      //         ? Image.file(_image, width: 200.0, height: 200.0, fit: BoxFit.fitHeight,)
      //         : Container(decoration: BoxDecoration(color: Colors.red[200]), width: 200, height: 200, child: Icon(Icons.camera_alt, color: Colors.grey[800],),
      //     ),
      //   ),
      // ):
      // Stack(
      //   alignment: Alignment.center,
      //     children: <Widget>[
      //       BackdropFilter(
      //         filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
      //         child: Image(image: AssetImage(
      //           'assets/images/bg.png',
      //         ),
      //           fit: BoxFit.fill,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
      //         ),
      //       ),
      //   Padding(
      //     padding: const EdgeInsets.all(33.0),
      //     child: Center(child: Lottie.asset('assets/lottie/whiteAnimation.json',height: 240,width: 190)),
      //   )
      // ])
    );
  }
}



