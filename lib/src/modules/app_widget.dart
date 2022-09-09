import 'package:ab_certus/src/modules/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: Modular.isModuleReady<AppModule>(),
    //     builder: (_, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return MaterialApp(
    //           home: Container(),
    //         );
    //       }
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
  //);
}
//}
