import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:my_comics/app/database/database.dart';
import 'package:my_comics/app/modules/home/models/comics_models.dart';

part 'detaisComics_store.g.dart';

class DetaisComicsStore = _DetaisComicsStoreBase with _$DetaisComicsStore;

abstract class _DetaisComicsStoreBase with Store {
  @observable
  int value = 0;

  @action
  addItensInCart(Results? results, image, prices) async {
    final database = await DatabaseHandler().initializeDB();
    final batch = database.batch();

    batch.insert(
      'CARTS',
      {
        'title': results?.title,
        'image': image,
        'price': await prices,
        'idcomics': results?.id,
      },
    );

    await batch.commit(noResult: true);

    Modular.to.pop(true);
  }
}
