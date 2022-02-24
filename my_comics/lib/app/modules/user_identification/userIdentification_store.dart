import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'userIdentification_store.g.dart';

class UserIdentificationStore = _UserIdentificationStoreBase
    with _$UserIdentificationStore;

abstract class _UserIdentificationStoreBase with Store {
  @observable
  String? userName;

  @observable
  String? errorName;

  @observable
  bool isLoading = false;

  @action
  validateAndSavedUserName(cnx) async {
    FocusScope.of(cnx).unfocus();

    isLoading = true;
    final prefs = await SharedPreferences.getInstance();

    if (userName == null) {
      isLoading = false;
      return errorName = "Oh, your name not empty";
    }

    prefs.setString('userName', userName.toString());
    prefs.setBool('isLogin', true);
    Modular.to.pushReplacementNamed('/home/');
  }
}
