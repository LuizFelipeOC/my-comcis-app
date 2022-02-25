import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_comics/app/modules/detais_comics/detaisComics_module.dart';
import 'package:my_comics/app/modules/splash/splash_module.dart';
import 'package:my_comics/app/modules/user_identification/userIdentification_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home/', module: HomeModule()),
    ModuleRoute('/user_identifcation/', module: UserIdentificationModule()),
    ModuleRoute('/detailsComics/', module: DetaisComicsModule())
  ];
}
