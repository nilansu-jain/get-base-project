import 'package:mvvm_getx/data/network/network_api_services.dart';
import 'package:mvvm_getx/res/appurl/app_url.dart';

class LoginRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(var data){

    dynamic response = _apiServices.postApi(data, AppUrl.loginApi);
    return response;
  }
}