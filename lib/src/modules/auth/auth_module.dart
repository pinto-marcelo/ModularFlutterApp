import 'package:ab_certus/src/modules/auth/blocs/login_bloc.dart';
import 'package:ab_certus/src/modules/auth/repositories/login_repository.dart';
import 'package:ab_certus/src/modules/auth/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => LoginRepository()),
        Bind.singleton((i) => LoginBloc(i(), i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => const LoginPage(),
        ),
      ];
}
