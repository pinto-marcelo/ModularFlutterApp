import 'package:ab_certus/src/modules/auth/blocs/events/login_event.dart';
import 'package:ab_certus/src/modules/auth/blocs/states/login_state.dart';
import 'package:ab_certus/src/modules/auth/repositories/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final SharedPreferences shared;

  LoginBloc(this.loginRepository, this.shared) : super(LoginIdle()) {
    on<LoginWithEmail>((event, emit) => null);
  }

  loginEmail(LoginWithEmail event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 1));

    try {
      await loginRepository.login(event.email, event.password);
      emit(
        LoginSucess(),
      );
      shared.setBool('is Logged', true);
    } catch (e) {
      emit(
        LoginFailure('Erro na senha ou email'),
      );
    }
  }
}
