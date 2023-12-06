
import 'package:get/get.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';
import 'package:mvvm_getx/view/home/home.dart';
import 'package:mvvm_getx/view/login/login_view.dart';
import 'package:mvvm_getx/view/splash_screen.dart';

class AppRoutes{

  static appRoutes () => [
    
    GetPage(name: RoutesName.splashScreen,
        page: () => SplashScreen(),
        transition: Transition.circularReveal ,
        transitionDuration: Duration(milliseconds: 250)),

    GetPage(name: RoutesName.loginScreen,
        page: () => LoginView(),
        transition: Transition.circularReveal ,
        transitionDuration: Duration(milliseconds: 250)),

    GetPage(name: RoutesName.home,
        page: () => Home(),
        transition: Transition.circularReveal ,
        transitionDuration: Duration(milliseconds: 250))
    
  ];
}