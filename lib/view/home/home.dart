import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/data/response/sttaus.dart';
import 'package:mvvm_getx/res/Components/general_exception.dart';
import 'package:mvvm_getx/res/Components/internet_exception.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';
import 'package:mvvm_getx/viewmodel/controller/home/home_controller.dart';
import 'package:mvvm_getx/viewmodel/controller/prefrences/UserPrefrences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserPrefrences userPrefrences = UserPrefrences();
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListapi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(onPressed: (){
          userPrefrences.removeUser().then((value) => {
            Get.toNamed(RoutesName.splashScreen)
          });
        }, icon: Icon(Icons.logout))
      ]),
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return Center(child: CircularProgressIndicator(),);
          case Status.ERROR:
            if(homeController.error.value.toString().contains("No Internet")){
              return InternetExceptionWidget(
                onPress: (){
                  homeController.refreshuserListapi();

                },
              );
            }else{
              return GeneralExceptionWidget(onPress: (){
                homeController.refreshuserListapi();
              });
            }
            return GeneralExceptionWidget(onPress: (){

            });
          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userlist.value.data!.length,
                itemBuilder: (context,index){
              return ListTile(
                title: Text(homeController.userlist.value.data![index].firstName!),
                subtitle: Text(homeController.userlist.value.data![index].email!),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(homeController.userlist.value.data![index].avatar!),
                ),
              );
            });

        }
      }),
    );
  }
}
