
import 'dart:async';

import 'package:get/get.dart';
import 'package:mvvm_getx/res/routes/routes.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';
import 'package:mvvm_getx/viewmodel/controller/prefrences/UserPrefrences.dart';

class SplashServices{

  UserPrefrences userPrefrences = UserPrefrences();
  isLogin(){

    userPrefrences.getUser().then((value)  {
      print(value);
      if(value.isLogin! == false || value.isLogin.toString() == 'null'){
        Timer(const Duration(seconds: 1), () {
          Get.toNamed(RoutesName.loginScreen);
        });
      }else{
        Timer(const Duration(seconds: 1), () {
          Get.toNamed(RoutesName.home);
        });
      }
    }).onError((error, stackTrace)  {
      print(error.toString());
      Timer(const Duration(seconds: 1), () {
        Get.toNamed(RoutesName.loginScreen);
      });
    });


  }
}