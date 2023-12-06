import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/localisation/languages.dart';
import 'package:mvvm_getx/res/routes/routes.dart';
import 'package:mvvm_getx/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      getPages: AppRoutes.appRoutes(),
      locale: Locale('en','US'),
      fallbackLocale: Locale('en','US'),
      translations: Languages(),
    );
  }
}


