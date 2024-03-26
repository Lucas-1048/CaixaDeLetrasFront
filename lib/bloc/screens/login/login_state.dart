part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailured extends LoginState {}

class LoginInternalError extends LoginState {}

class LoginUnKownError extends LoginState {
  final String message;
  const LoginUnKownError(this.message);
}

class LoginSuccess extends LoginState {}
