import 'package:get/get.dart';
import 'package:mvvm_getx/data/response/sttaus.dart';
import 'package:mvvm_getx/model/home/UserListModel.dart';
import 'package:mvvm_getx/respository/home_repository/home_repository.dart';

class HomeController extends GetxController{

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userlist = UserListModel().obs;
  RxString error =''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserListModel(UserListModel _value) => userlist.value =_value;
  void setError(String _value) => error.value =_value;

  void userListapi(){
    _api.userList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserListModel(value);
    }
    ).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  void refreshuserListapi(){
    setRxRequestStatus(Status.LOADING);

    _api.userList().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserListModel(value);
    }
    ).onError((error, stackTrace) {
      print('error >>> $     ');
      print('stacktrace >>>>> $stackTrace');
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}