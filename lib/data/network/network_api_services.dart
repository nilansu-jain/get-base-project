import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mvvm_getx/data/app_exceptions.dart';
import 'package:mvvm_getx/data/network/bse_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiService{
  
  
  
  @override
  Future getApi(String url) async{
    // TODO: implement getApi
    if(kDebugMode){
      print(url);
    }


    dynamic responseJson;

    try{

      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);

    }on SocketException{
      throw InternetException();
    }on RequestTimeOut{
      throw RequestTimeOut();
    }

    return responseJson;
  }

  
  
  @override
  Future postApi(var data, String url) async{
    // TODO: implement postApi
    if(kDebugMode){
      print(url);
      print(data);
    }
    dynamic responseJson;

    try{

      final response = await http.post(Uri.parse(url),
      // body: jsonEncode(data)  // if data is to be send in raw format
        body : data        //if data is to be send in form-data format
      ).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    }on SocketException{
      throw InternetException();
    }on RequestTimeOut{
      throw RequestTimeOut();
    }

    if(kDebugMode)
      {
        print('response  $responseJson');
      }
    return responseJson;
  }


  dynamic returnResponse(http.Response response){
    print('status code = ${response.statusCode}');
    switch(response.statusCode){
      case 200:
        dynamic resoponseJson = jsonDecode(response.body);
        return resoponseJson;

      case 400:
        dynamic resoponseJson = jsonDecode(response.body);
        return resoponseJson;
        // throw InvalidUrlException();

      default:
        throw FetchDataException("error occuured while communicating with server "+response.statusCode.toString());
    }
  }


}