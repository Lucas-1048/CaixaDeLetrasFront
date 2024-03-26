part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginFetchEvent extends LoginEvent {
  const LoginFetchEvent({required this.loginUser});
  final LoginUser loginUser;
}
