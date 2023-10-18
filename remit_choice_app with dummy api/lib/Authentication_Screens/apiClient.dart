// ignore_for_file: file_names

import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response> registerUser(Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(
        'https://api.loginradius.com/identity/v2/manage/account',
        data: userData,
        queryParameters: {
          'apikey': 'https://api.loginradius.com/identity/v2/manage/account'
        },
        // options: Options(headers: {
        //   'X-LoginRadius-Sott': 'YOUR_SOTT_KEY',
        // }
      );

      return response;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://api.loginradius.com/identity/v2/auth/login',
        data: {'email': email, 'password': password},
        queryParameters: {
          'apikey':
              "https://api.loginradius.com/identity/v2/auth/login/smartlogin"
        },
      );
      return response;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/account',
        queryParameters: {
          'apikey': 'https://api.loginradius.com/identity/v2/manage/account'
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      return response;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
        queryParameters: {
          'apikey':
              'https://api.loginradius.com/identity/v2/manage/account/forgot/token'
        },
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      return e.response!;
    }
  }
}
