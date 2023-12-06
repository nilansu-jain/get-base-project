import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/Components/round_button.dart';
import 'package:mvvm_getx/utills/utils.dart';
import 'package:mvvm_getx/viewmodel/controller/login/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginController controller = Get.put(LoginController());
  final _formkey =GlobalKey<FormState>();

  var height = Get.height;
  var width = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('login'.tr,),
      ),
      body: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Form(
                key: _formkey,
                child: Column(
              children: [
                TextFormField(
                  controller: controller.emailController.value,
                  focusNode: controller.emailFocusnode.value,
                  validator: (value){
                    if(value!.isEmpty){
                      print('email emptyy');
                      Utils.snackbar("error".tr, "enter_email".tr);
                    }
                  },
                  onFieldSubmitted: (value){
                    Utils.fieldFocusChange(context, controller.emailFocusnode.value, controller.passwordFocusNode.value);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'email'.tr
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 50,),
                TextFormField(
                  controller: controller.passwordController.value,
                  focusNode: controller.passwordFocusNode.value,
                  validator: (value){
                    if(value!.isEmpty){
                      print('password emptyy');

                      Utils.snackbar('error'.tr, 'enter_pass'.tr);
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'password'.tr
                  ),
                  obscureText: true,
                ),
              ],
            )),


            SizedBox(height: 50,),

            Obx(()=>
               RoundButton(
                title: 'submit'.tr,
                loading: controller.loading.value,
                onPress: () {
                  if(_formkey.currentState!.validate()){
                    print('button click');
                    controller.loginApi();
                  }
                },
                width: width *.5,
              ),
            )

          ],
        ),
      ),
    );
  }
}
