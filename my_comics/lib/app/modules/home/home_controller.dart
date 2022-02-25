import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:my_comics/app/modules/home/models/comics_models.dart';
import 'package:http/http.dart' as http;
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase() {
    getComics();
  }

  @observable
  Comics? comics;

  @observable
  bool isLoading = false;

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
}
