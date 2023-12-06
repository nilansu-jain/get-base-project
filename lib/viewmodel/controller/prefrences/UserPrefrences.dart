import '../../../model/login/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences{


  Future<bool>  savePref(UserModel model)  async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', model.token.toString());
    sp.setBool('isLogin', model.isLogin!);

    return true;

  }

  Future<UserModel>  getUser()  async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    bool? isLogin = sp.getBool('isLogin');

    return UserModel(
      token: token,
      isLogin: isLogin
    );

  }

  Future<bool>  removeUser()  async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;

  }
}