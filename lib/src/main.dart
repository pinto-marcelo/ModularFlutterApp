import 'package:ab_certus/src/modules/app_module.dart';
import 'package:ab_certus/src/modules/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

//https://www.youtube.com/watch?v=3EV4ESweZzc 2:33
void main() {
  Modular.to.addListener(() {
    print(Modular.to.path);
  });

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
