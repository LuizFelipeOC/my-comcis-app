import 'package:my_comics/app/modules/user_identification/userIdentification_Page.dart';
import 'package:my_comics/app/modules/user_identification/userIdentification_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserIdentificationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => UserIdentificationStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const UserIdentificationPage(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
