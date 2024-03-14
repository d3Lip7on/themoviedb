import 'dart:convert';
import 'dart:io';

import 'package:themoviedb/domain/entities/popular_movie_response.dart';

enum ApiClientExceptionType { Network, Auth, Other }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;
  ApiClientException({required this.type});
}

class ApiClient {
  final _client = HttpClient();

  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = 'b5ac307a204fd37199ec5fd9ef88d87a';

  static String imageUrl(String path) => _imageUrl + path;

  Future<String> auth(
      {required String username, required String password}) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
        username: username, password: password, requestToken: token);
    final sessionId = await _makeSession(requestToken: validToken);
    return sessionId;
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<T> _get<T>(String path, T Function(dynamic json) parser,
      [Map<String, dynamic>? parameters]) async {
    final url = _makeUri(path, parameters);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(type: ApiClientExceptionType.Network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(type: ApiClientExceptionType.Other);
    }
  }

  Future<T> _post<T>(String path, T Function(dynamic json) parser,
      {Map<String, dynamic>? urlParameters,
      Map<String, dynamic>? bodyParameters}) async {
    final url = _makeUri(path, urlParameters);
    try {
      final request = await _client.postUrl(url);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(bodyParameters));
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(type: ApiClientExceptionType.Network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(type: ApiClientExceptionType.Other);
    }
  }

  Future<String> _makeToken() async {
    parser(json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    }

    const path = '/authentication/token/new';
    return _get(path, parser, <String, dynamic>{"api_key": _apiKey});
  }

  Future<String> _validateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    parser(json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    }

    const path = '/authentication/token/validate_with_login';
    final urlParameters = {"api_key": _apiKey};
    final bodyParameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken,
    };
    final token = await _post(
      path,
      parser,
      urlParameters: urlParameters,
      bodyParameters: bodyParameters,
    );
    return token;
  }

  Future<String> _makeSession({required String requestToken}) async {
    const path = '/authentication/session/new?api_key=';
    final urlParameters = {"api_key": _apiKey};
    final bodyParameters = <String, dynamic>{"request_token": requestToken};
    parser(json) {
      final jsonMap = json as Map<String, dynamic>;
      final sessionId = jsonMap['session_id'] as String;
      return sessionId;
    }

    final sessionId = await _post(path, parser,
        urlParameters: urlParameters, bodyParameters: bodyParameters);
    return sessionId;
  }

  Future<PopularMovieResponse> getPopularMovies(
      {String page = "1", String language = 'ru-RU'}) async {
    const path = '/movie/popular';
    final urlParameters = <String, dynamic>{
      "api_key": _apiKey,
      "page": page,
      "language": language,
    };
    parser(json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = PopularMovieResponse.fromJson(jsonMap);
      return result;
    }

    final result = await _get(path, parser, urlParameters);
    return result;
  }

  void _validateResponse(HttpClientResponse response, dynamic json) {
    if (response.statusCode == 401) {
      final apiStatusCode = json['status_code'] as int;
      if (apiStatusCode == 30) {
        throw ApiClientException(type: ApiClientExceptionType.Auth);
      }
      throw ApiClientException(type: ApiClientExceptionType.Other);
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => json.decode(value));
  }
}
