import 'package:mvvm_getx/data/network/network_api_services.dart';
import 'package:mvvm_getx/model/home/UserListModel.dart';
import 'package:mvvm_getx/res/appurl/app_url.dart';

class HomeRepository{

  final _apiServices = NetworkApiServices();

  Future<UserListModel> userList() async{

    dynamic response = await _apiServices.getApi( '${AppUrl.userList}2');
    return UserListModel.fromJson(response);
  }
}