import 'package:ab_certus/src/modules/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then(
      (_) async {
        await Modular.isModuleReady<AppModule>();
        //Modular.to.navigate('/products/');
        Modular.to.navigate('/auth/');
        //Modular.to.navigate('/login/');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Material(
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
