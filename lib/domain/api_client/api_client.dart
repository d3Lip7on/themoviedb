import 'dart:convert';
import 'dart:io';

class ApiClient {
  final _client = HttpClient();

  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/p/w500';
  static const _apiKey = 'b5ac307a204fd37199ec5fd9ef88d87a';

  Future<String> auth(
      {required String username, required String password}) async {
    final token = await makeToken();
    final validToken = await validateUser(
        username: username, password: password, requestToken: token);
    final sessionId = await makeSession(requestToken: validToken);
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

  Future<String> makeToken() async {
    final url = _makeUri('/authentication/token/new', {"api_key": _apiKey});
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    final token = json['request_token'] as String;
    return token;
  }

  Future<String> validateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    final url = _makeUri(
        '/authentication/token/validate_with_login', {"api_key": _apiKey});
    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken,
    };
    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    final token = json['request_token'] as String;
    return token;
  }

  Future<String> makeSession({required String requestToken}) async {
    final url =
        _makeUri('/authentication/session/new?api_key=', {"api_key": _apiKey});
    final parameters = <String, dynamic>{"request_token": requestToken};
    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    final sessionId = json['session_id'] as String;
    return sessionId;
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
