import 'package:flutter/material.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/api_client/data_providers/session_data_provider.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Fill in login and password';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();

    String? sessionId;
    try {
      sessionId = await _apiClient.auth(username: login, password: password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.Network:
          _errorMessage = 'Some problems with network. Please check your '
              'connection and try again';
          break;
        case ApiClientExceptionType.Auth:
          _errorMessage = 'Invalid login or password';
          break;
        case ApiClientExceptionType.Other:
          _errorMessage = 'Something bad happened. Try again later';
        default:
          break;
      }
    } catch (e) {
      _errorMessage = 'Something bad happened. Try again later';
    }

    _isAuthProgress = false;

    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (sessionId == null) {
      _errorMessage = 'Unknown error, try again';
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    Navigator.of(context)
        .pushReplacementNamed(MainNavigationRoutesNames.mainScreen);
  }
}
