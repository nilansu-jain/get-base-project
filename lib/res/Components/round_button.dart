import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/color/colors.dart';

class RoundButton extends StatelessWidget {

  final bool loading;
  final double height;
  final double width;
  final VoidCallback onPress;
  final Color textcolor, buttonColor;
  final String title;

  const RoundButton({Key? key,
    this.loading = false,
    this.height=50,
    this.width =100,
    required this.onPress,
  this.buttonColor=AppColor.primaryButtonColor,
  this.textcolor=AppColor.textColor,
  required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50)
        ),
        child: loading ?
        Center(child: CircularProgressIndicator())
        :
        Center(
          child: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textcolor,

          ),),
        ),

      ),
    );
  }
}
