import 'package:mobx/mobx.dart';

part 'detaisComics_store.g.dart';

class DetaisComicsStore = _DetaisComicsStoreBase with _$DetaisComicsStore;
abstract class _DetaisComicsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}