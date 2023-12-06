import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {

    'en_US' :{
      'name' : 'satka matka',
      'welcome_msg' : 'Welcome to satka matka',
      'internet' : 'Internet Connection Failed',
      'internet_failed' : 'you are out of internet \n check your internet \n connection',
      'retry' : 'Retry',
      'general_exception':"we are unable to proceed your request \n please try again",
      'login' : 'Login',
      'email' : 'Enter Email',
      'password' : "Enter Password",
      'submit': 'Submit',
      'error':'Error',
      'success':'Success',

      'enter_email':"Please Enter Email",
      'enter_pass':"Please Enter Password"




    },

    'hi_IN' :{
      'name' : 'सट्टा मटका'
    },
  };

}