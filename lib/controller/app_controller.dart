import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AppController extends ChangeNotifier{

  File? imageCamera;
  File? imageGallery;
  final picker = ImagePicker();

  getCameraTypeAccess() async{
    final pickedImageCamera = await picker.pickImage(source: ImageSource.camera);
      if(pickedImageCamera != null){
        imageCamera = File(pickedImageCamera.path);
        notifyListeners();
      }

  }

  getGalleryAccess() async{
    final pickedImageGallery = await picker.pickImage(source: ImageSource.gallery);
      if(pickedImageGallery != null){
        imageGallery = File(pickedImageGallery.path);
      }
    notifyListeners();
  }
}