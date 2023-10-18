// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class AuthenticationProvider with ChangeNotifier {
  String? _accessToken;

  String? get accessToken => _accessToken;

  void login(String token) {
    _accessToken = "QpwL5tke4Pnpja7X4";
    notifyListeners();
  }

  void logout() {
    _accessToken = null;
    notifyListeners();
  }
}
