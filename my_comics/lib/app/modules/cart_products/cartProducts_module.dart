import 'package:my_comics/app/modules/cart_products/cartProducts_Page.dart';
import 'package:my_comics/app/modules/cart_products/cartProducts_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartProductsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const CartProductsPage(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
