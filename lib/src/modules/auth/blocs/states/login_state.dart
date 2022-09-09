abstract class LoginState {}

class LoginSucess implements LoginState {}

class LoginLoading implements LoginState {}

class LoginIdle implements LoginState {}

class LoginFailure implements LoginState {
  final String message;

  LoginFailure(this.message);
}
