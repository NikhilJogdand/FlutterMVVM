import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiService.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> register(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registrationEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}