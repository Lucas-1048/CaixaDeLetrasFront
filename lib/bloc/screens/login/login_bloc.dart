import 'dart:async';
import 'package:caixa_de_letras/controller/User/ctl_login_user.dart';
import 'package:caixa_de_letras/models/User/login_user.dart';
import 'package:caixa_de_letras/utils/exceptions/api_general/server_error.dart';
import 'package:caixa_de_letras/utils/exceptions/api_general/unknow_error.dart';
import 'package:caixa_de_letras/utils/exceptions/login/user_login_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginFetchEvent>(_loginFetchEvent);
  }

  FutureOr<void> _loginFetchEvent(event, emit) async {
    emit(LoginLoading());
    try {
      CtlLoginUser ctlLoginUser = CtlLoginUser();
      await ctlLoginUser.loginFetch(event.loginUser);

      emit(LoginSuccess());
    } on UserLoginException {
      emit(LoginFailured());
      return;
    } on ServerErroException {
      emit(LoginInternalError());
      return;
    } on UnKonwError catch (error) {
      emit(LoginUnKownError(error.message));
    }
  }
}
