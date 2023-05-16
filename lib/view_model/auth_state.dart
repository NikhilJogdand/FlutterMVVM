import 'package:flutter/foundation.dart';
import 'package:mvvm/model/login_response.dart';

@immutable
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginResponse loginResponse;

  LoginSuccessState({required this.loginResponse});
}

class LoginErrorState extends LoginState {
  LoginErrorState({required this.message});

  final String message;
}
