import 'package:get/get.dart';

enum LoginStatus { loggedIn, notLoggedIn }

class AuthController extends GetxController {
  Rx<LoginStatus> status = LoginStatus.notLoggedIn.obs;

  void setLoginStatus(LoginStatus value) {
    status.value = value;
  }

  bool get isLoggedIn => status.value == LoginStatus.loggedIn;
}