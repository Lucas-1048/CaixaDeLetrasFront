import 'package:caixa_de_letras/models/User/login_user.dart';
import 'package:caixa_de_letras/utils/exceptions/api_general/server_error.dart';
import 'package:caixa_de_letras/utils/exceptions/api_general/unknow_error.dart';
import 'package:caixa_de_letras/utils/exceptions/login/user_login_exception.dart';
import 'package:caixa_de_letras/utils/hive/tokens/hive_tokens.dart';
import 'package:dio/dio.dart';

class DioLoginUser {
  Future<void> loginFetch(LoginUser loginUser) async {
    try {
      final dio = Dio();
      final response = await dio.post('http://144.22.196.74:52368/login',
          data: loginUser.toJson(),
          options: Options(headers: {'Content-Type': 'application/json'}));
      if (response.statusCode == 401) {
        throw UserLoginException('Usuário ou senha inválidos ');
      }
      if (response.statusCode == 500) {
        throw ServerErroException('Erro interno no servidor');
      }
      await HiveTokens.tokenBox!
          .put('accessToken', response.data['accessToken']);
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 401) {
          throw UserLoginException('Usuário ou senha inválidos ');
        }
        if (error.response!.statusCode == 500) {
          throw ServerErroException('Erro interno no servidor');
        }
      }
    } catch (error) {
      throw UnKonwError(error.toString());
    }
  }
}
