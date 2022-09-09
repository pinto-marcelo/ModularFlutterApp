class LoginRepository {
  Future<bool> login(String email, String password) async {
    if (email == 'jacob@flutterando.com.br' && password == '123') {
      return true;
    } else {
      throw Exception('Erro ao logar');
    }
  }
}
