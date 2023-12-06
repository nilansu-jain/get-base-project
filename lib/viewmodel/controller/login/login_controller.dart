import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/model/login/UserModel.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';
import 'package:mvvm_getx/respository/login_repository/login_repository.dart';
import 'package:mvvm_getx/utills/utils.dart';
import 'package:mvvm_getx/viewmodel/controller/prefrences/UserPrefrences.dart';

class LoginController extends GetxController{

  final _api = LoginRepository();

  UserPrefrences userPrefrences = UserPrefrences(); 

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  Rx emailFocusnode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void loginApi(){
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    _api.loginApi(data).then((value)  {

      if(value['error']== 'user not found'){
        Utils.snackbar('Login'.tr, value['error']);

      }else{
        UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true
        );

        userPrefrences.savePref(userModel).then((value) {

          Get.delete<LoginController>();
          Get.toNamed(RoutesName.home)!.then((value) {});
        }).onError((error, stackTrace) => null);
      }
      Utils.snackbar('Succesful'.tr, 'success'.tr);

      loading.value = false;
    }).onError((error, stackTrace) {
      print(error.toString());
      Utils.snackbar('error'.tr, error.toString());
      loading.value = false;
    });
  }
}