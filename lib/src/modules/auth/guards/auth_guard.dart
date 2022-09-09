import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    return false; //or true
  }
}
