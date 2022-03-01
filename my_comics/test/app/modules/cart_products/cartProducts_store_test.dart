import 'package:flutter_test/flutter_test.dart';
import 'package:my_comics/app/modules/cart_products/cartProducts_store.dart';
 
void main() {
  late CartProductsStore store;

  setUpAll(() {
    store = CartProductsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}