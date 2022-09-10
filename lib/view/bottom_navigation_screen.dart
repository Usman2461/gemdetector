import 'package:camera/camera.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemdetector/controller/app_controller.dart';
import 'package:gemdetector/utils/colors.dart';
import 'package:gemdetector/view/preveiw_img.dart';
import 'package:provider/provider.dart';
import '../utils/constant.dart';
import 'camera_view.dart';
import 'drawer.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;
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
    return Scaffold(
      floatingActionButtonLocation: tabIndex == 1
          ? FloatingActionButtonLocation.centerFloat
          : tabIndex == 2
              ? FloatingActionButtonLocation.miniEndFloat
              : FloatingActionButtonLocation.startFloat,
      floatingActionButton: tabIndex == 0
          ? FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                showAlertDialog(context);
                setState(() {
                  clickedCentreFAB = !clickedCentreFAB;
                });
              },
              tooltip: "Capture stone image",
              elevation: 4.0,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: const Icon(Icons.menu_open_outlined),
              ),
            )
          : tabIndex == 1
              ? FloatingActionButton(
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    appControllerProvider!.getCameraTypeAccess();
                    setState(() {
                      clickedCentreFAB = !clickedCentreFAB;
                    });
                  },
                  tooltip: "Capture stone image",
                  elevation: 4.0,
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: const Icon(Icons.add_a_photo_outlined),
                  ),
                )
              : tabIndex == 2
                  ? FloatingActionButton(
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () {
                        appControllerProvider!.getGalleryAccess();
                        setState(() {
                          clickedCentreFAB = !clickedCentreFAB;
                        });
                      },
                      tooltip: "Capture stone image",
                      elevation: 4.0,
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        child: const Icon(Icons.image_outlined),
                      ),
                    )
                  : const SizedBox(),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        items: const <Widget>[
          Icon(Icons.menu, size: 30, color: Colors.white),
          Icon(Icons.camera_alt_outlined, size: 30, color: Colors.white),
          Icon(Icons.photo_library_outlined, size: 30, color: Colors.white),
        ],
        color: AppColors.primaryColor,
        // buttonBackgroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.navigationBgColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) async {
          // openCamera();
          setState(() {
            tabIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      // drawer: DrawerScreenOne(),
      body: _widgetOptions.elementAt(tabIndex),
    );
  }
}
