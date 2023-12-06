import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/color/colors.dart';

class Utils{

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextfocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  static toastMessage(String msg){
    Fluttertoast.showToast(msg: msg,
    backgroundColor: AppColor.blackColor,
    webPosition: "center",
    textColor: AppColor.whiteColor,
    fontSize: 18,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 10);
  }

  static snackbar(String title, String msg){
    Get.snackbar(title, msg,
        snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.BOTTOM);
  }
}