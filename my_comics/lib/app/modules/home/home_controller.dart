import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:my_comics/app/database/database.dart';
import 'package:my_comics/app/modules/home/models/comics_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase() {
    getComics();
    countCart();
    getUsername();
  }

  @observable
  Comics? comics;

  @observable
  dynamic quantityCartsItems = 0;

  @observable
  bool isLoading = false;

  @observable
  String? userName;

  @action
  getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName');
  }

  @action
  getComics() async {
    isLoading = true;
    final client = http.Client();

    final response = await client.get(
      Uri.parse(
        'http://gateway.marvel.com/v1/public/comics?ts=1&apikey=049939b824b36aa1d2c7d5d2cb2c218d&hash=735e8f66a8e0568ca5fd4641f1981ebb',
      ),
    );

    if (response.statusCode != 200) {
      isLoading = false;
      return;
    }

    final jsondecode = jsonDecode(response.body);
    comics = Comics.fromJson(jsondecode);

    isLoading = false;
  }

  @action
  countCart() async {
    final database = await DatabaseHandler().initializeDB();

    final length = await database.query('CARTS');

    quantityCartsItems = length.length;
  }
}
