import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/color/colors.dart';

class InternetExceptionWidget extends StatefulWidget {

  final VoidCallback onPress;

  const InternetExceptionWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {

  final height = Get.height;
  
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        SizedBox(height: height *.15,),
        Icon(Icons.cloud_off, color: AppColor.redColor,size: 50,),
        Center(child: Text('internet'.tr,style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),)),
        Text('internet_failed'.tr,textAlign: TextAlign.center,),
        SizedBox(height: 30,),
        InkWell(
          onTap: widget.onPress,
          child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: AppColor.redColor,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Text("retry".tr, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.textColor)))),
        )
      ],
    ),);
  }
}
