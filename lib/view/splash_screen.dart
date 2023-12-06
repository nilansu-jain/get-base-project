
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/data/app_exceptions.dart';
import 'package:mvvm_getx/res/Components/general_exception.dart';
import 'package:mvvm_getx/res/Components/internet_exception.dart';
import 'package:mvvm_getx/res/Components/round_button.dart';
import 'package:mvvm_getx/res/assets/image_assets.dart';
import 'package:mvvm_getx/res/color/colors.dart';
import 'package:mvvm_getx/utills/utils.dart';
import 'package:mvvm_getx/viewmodel/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices services = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Text('welcome_msg'.tr,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.textColor),),
      ),
    );
  }
}
