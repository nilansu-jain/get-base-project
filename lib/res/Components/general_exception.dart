import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/color/colors.dart';

class GeneralExceptionWidget extends StatefulWidget {

  final VoidCallback onPress;

  const GeneralExceptionWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {

  final height = Get.height;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height *.15,),
          Icon(Icons.error, color: AppColor.redColor,size: 50,),
          Text('general_exception'.tr,textAlign: TextAlign.center,),
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
