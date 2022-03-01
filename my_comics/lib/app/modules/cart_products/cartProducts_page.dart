import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_comics/app/core/themes/app_colors.dart';
import 'package:my_comics/app/core/themes/app_text_styles.dart';
import 'package:my_comics/app/modules/cart_products/cartProducts_store.dart';
import 'package:flutter/material.dart';

class CartProductsPage extends StatefulWidget {
  const CartProductsPage({Key? key}) : super(key: key);
  @override
  CartProductsPageState createState() => CartProductsPageState();
}

class CartProductsPageState
    extends ModularState<CartProductsPage, CartProductsStore> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screen.height * .20),
        child: SafeArea(
          child: SizedBox(
            height: screen.height * .15,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                    color: AppColors.orangeComics.withOpacity(0.9),
                    iconSize: 30,
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 30,
                    ),
                    onPressed: () {
                      Modular.to.pop(true);
                    },
                  ),
                  Text(
                    'My Cart',
                    style: AppStyles.title,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Observer(
              builder: (_) {
                return controller.isLoading
                    ? const CircularProgressIndicator(
                        strokeWidth: 1,
                        color: AppColors.orangeComics,
                      )
                    : Container(
                        height: screen.height * 0.8,
                        margin: const EdgeInsets.only(bottom: 100),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.listCarts?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                color: AppColors.greyComics.withOpacity(0.5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CachedNetworkImage(
                                            width: 100,
                                            height: 100,
                                            imageUrl:
                                                '${controller.listCarts?[index]['image']}',
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: screen.width * .35,
                                                child: Text(
                                                  '${controller.listCarts?[index]['title']}',
                                                  style: AppStyles.title,
                                                ),
                                              ),
                                              Text(
                                                'Id Comics: ${controller.listCarts?[index]['idcomics']}',
                                                style: AppStyles.nameComic,
                                              ),
                                              Text(
                                                'Price: \$ ${controller.listCarts?[index]['price']}',
                                                style: AppStyles.nameComic,
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              controller.deleteCommisList(
                                            controller.listCarts?[index]['id'],
                                          ),
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            )
          ],
        ),
      ),
      bottomSheet: Container(
        height: screen.height * .10,
        color: AppColors.background.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Total: ',
              style: AppStyles.txButton,
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${controller.total}',
                  style: AppStyles.title,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
