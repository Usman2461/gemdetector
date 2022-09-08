import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gemdetector/controller/app_controller.dart';
import 'package:gemdetector/test.dart';
import 'package:gemdetector/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppController()),
        ],
      builder: (context,child){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home:  MyApppp(),
            home:  SplashScreen(),
          );
      },
    );
  }
}
