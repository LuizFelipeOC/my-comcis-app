import 'package:mobx/mobx.dart';
import 'package:my_comics/app/database/database.dart';

part 'cartProducts_store.g.dart';

class CartProductsStore = _CartProductsStoreBase with _$CartProductsStore;

abstract class _CartProductsStoreBase with Store {
  _CartProductsStoreBase() {
    getCartsProducts();
  }

  @observable
  List? listCarts;

  @observable
  dynamic total;

  @observable
  bool isLoading = false;

  @action
  getCartsProducts() async {
    isLoading = true;
    final databse = await DatabaseHandler().initializeDB();

    await databse.query('CARTS').then(
      (value) {
        total = 0;
        listCarts = value;
        listCarts?.forEach(
          (element) {
            total += element['price'];
          },
        );
      },
    );
    isLoading = false;
  }

  deleteCommisList(id) async {
    isLoading = true;
    final databse = await DatabaseHandler().initializeDB();
    final batch = databse.batch();

    batch.delete('CARTS', where: 'id = ?', whereArgs: [id]);

    await batch.commit(noResult: true);

    getCartsProducts();
  }
}
