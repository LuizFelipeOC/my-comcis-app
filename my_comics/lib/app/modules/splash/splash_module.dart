import 'package:my_comics/app/modules/splash/splash_Page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_comics/app/modules/splash/splash_controller.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SplashController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const SplashPage(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
