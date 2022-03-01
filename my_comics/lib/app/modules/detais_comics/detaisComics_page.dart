import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_comics/app/components/button_component.dart';
import 'package:my_comics/app/core/themes/app_colors.dart';
import 'package:my_comics/app/core/themes/app_text_styles.dart';
import 'package:my_comics/app/modules/detais_comics/detaisComics_store.dart';
import 'package:flutter/material.dart';
import 'package:my_comics/app/modules/home/models/comics_models.dart';

class DetaisComicsPage extends StatefulWidget {
  final Results? infos;
  const DetaisComicsPage({Key? key, this.infos}) : super(key: key);
  @override
  DetaisComicsPageState createState() => DetaisComicsPageState();
}

class DetaisComicsPageState extends State<DetaisComicsPage> {
  final DetaisComicsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screen.height * .50),
        child: SizedBox(
          child: Stack(
            children: [
              SizedBox(
                height: screen.height * .50,
                child: Image.network(
                  '${widget.infos?.thumbnail?.path}.${widget.infos?.thumbnail?.extension}',
                  width: screen.height * 90,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 10,
                  left: 10,
                  bottom: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: AppStyles.title,
                    ),
                    Text(
                      widget.infos?.textObjects?.isEmpty == true
                          ? 'Oh! no we have this information'
                          : '${widget.infos?.textObjects?.first.text}',
                      style: AppStyles.label,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 10,
                  left: 10,
                  bottom: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Others Informations',
                      style: AppStyles.title,
                    ),
                    Text(
                      'Comic Format: ${widget.infos?.format}',
                      style: AppStyles.label,
                    ),
                    Text(
                      'Comic Price: \$ ${widget.infos?.prices?.first.price} ',
                      style: AppStyles.label,
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                height: 56,
                width: screen.width,
                child: ButtonComponent(
                  title: Text(
                    "Adcionar no carrinho",
                    style: AppStyles.txButton,
                  ),
                  onPressed: () => store.addItensInCart(
                    widget.infos,
                    '${widget.infos?.thumbnail?.path}.${widget.infos?.thumbnail?.extension}',
                    ' ${widget.infos?.prices?.first.price}',
                  ),
                ),
              ),
              Container(
                width: screen.width,
                child: TextButton(
                  child: Text(
                    'Voltar',
                    style: AppStyles.title,
                  ),
                  onPressed: () => Modular.to.pop(true),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
