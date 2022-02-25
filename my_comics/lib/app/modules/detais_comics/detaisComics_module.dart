import 'package:my_comics/app/modules/detais_comics/detaisComics_Page.dart';
import 'package:my_comics/app/modules/detais_comics/detaisComics_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetaisComicsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetaisComicsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => DetaisComicsPage(infos: args.data),
      transition: TransitionType.fadeIn,
    ),
  ];
}
