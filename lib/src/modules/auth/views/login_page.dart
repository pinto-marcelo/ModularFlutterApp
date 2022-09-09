import 'package:ab_certus/src/modules/auth/blocs/events/login_event.dart';
import 'package:ab_certus/src/modules/auth/blocs/login_bloc.dart';
import 'package:ab_certus/src/modules/auth/blocs/states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var state;

  @override
  void initState() {
    super.initState();
    bloc.stream.listen((event) async {
      if (state is LoginSucess) {
        await Future.delayed(const Duration(milliseconds: 300));
        Modular.to.navigate('/products/');
      }

      if (state is LoginFailure) {
        final banner = MaterialBanner(
          content: const Text("erro Login"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: const Text('Chato'))
          ],
        );
        ScaffoldMessenger.of(context).showMaterialBanner(banner);
      }
    });
  }

  final bloc = Modular.get<LoginBloc>();

  @override
  void dispose() {
    super.dispose();
    Modular.dispose<LoginBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoginSucess) {
              return const Center(
                child: Text('Entrou'),
              );
            }
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  bloc.add(LoginWithEmail(
                      password: '123', email: 'jacob@flutterando.com.br'));
                  Modular.to.navigate('/products/');
                },
                child: const Text("Entrar"),
              ),
            );
          }),
    );
  }
}
