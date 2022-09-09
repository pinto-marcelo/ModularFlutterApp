abstract class LoginEvent {}

class LoginWithEmail extends LoginEvent {
  final String password;
  final String email;

  LoginWithEmail({required this.password, required this.email});
}
