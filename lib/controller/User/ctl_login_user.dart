import 'package:caixa_de_letras/dio/User/dio_login_user.dart';
import 'package:caixa_de_letras/models/User/login_user.dart';

class CtlLoginUser {
  Future<void> loginFetch(LoginUser loginUser) async {
    try {
      DioLoginUser dioLoginUser = DioLoginUser();
      await dioLoginUser.loginFetch(loginUser);
    } catch (error) {
      rethrow;
    }
  }
}
