import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_comics/app/components/card_component.dart';
import 'package:my_comics/app/core/themes/app_colors.dart';
import 'package:my_comics/app/core/themes/app_text_styles.dart';
import 'package:my_comics/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screen.height * .20),
        child: SafeArea(
          child: SizedBox(
            height: screen.height * .10,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, User',
                    style: AppStyles.title,
                  ),
                  IconButton(
                    color: AppColors.orangeComics,
                    iconSize: 30,
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: screen.height * .85,
          child: Observer(
            builder: (_) {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orangeComics,
                        strokeWidth: 1,
                      ),
                    )
                  : controller.comics == null
                      ? Center(
                          child: Text(
                            'Houve um erro na requisição',
                            style: AppStyles.title,
                          ),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.comics?.data?.comics?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: CardComponent(
                                infos: controller.comics?.data?.comics?[index],
                              ),
                            );
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
