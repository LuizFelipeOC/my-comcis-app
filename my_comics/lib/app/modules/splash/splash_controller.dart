import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  _SplashControllerBase() {
    isLogedVerify();
  }

  isLogedVerify() async {
    final prefs = await SharedPreferences.getInstance();

    final isLogin = prefs.getBool('isLogin');

    if (isLogin == null) {
      return Modular.to.pushReplacementNamed('/user_identifcation/');
    }

    return Modular.to.pushReplacementNamed('/home/');
  }
}
