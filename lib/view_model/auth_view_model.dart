import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm/model/login_response.dart';
import 'package:mvvm/view_model/auth_state.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends StateNotifier<LoginState> {
  AuthViewModel() : super(InitialLoginState());

  AuthRepository _repository = AuthRepository();

  void performLogin(dynamic data, BuildContext context) async {
    state = LoginLoadingState();
    await _repository.login(data).then((value) {
      final loginResponse = LoginResponse(token: value['token'].toString());
      state = LoginSuccessState(
          loginResponse: loginResponse);
      print(value);
      Utils.snakeBar(loginResponse.token, context);
    }).onError((error, stackTrace) {
      state = LoginErrorState(message: error.toString());
      Utils.snakeBar(error.toString(), context);
      print(error);
    });
  }
}

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, LoginState>((ref) => AuthViewModel());
