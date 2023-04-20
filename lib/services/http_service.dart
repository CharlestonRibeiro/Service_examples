import 'package:http/http.dart' as http;
import 'package:services/services/custom_exception.dart';

class HttpService {
  final String _baseUrl = 'Colocar aqui a URL';

  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Future<dynamic> get(String url, {Map<String, String>? headerSelected}) async {
    try {
      String urlCompleta = _baseUrl + url;
      final response = await http.get(Uri.parse(urlCompleta),
          headers: headerSelected ?? headers);
      VerifyResponse.verifyResponse(response);
      return response;
    } on CustomException catch (e) {
      throw CustomException(errorMessage: e.errorMessage);
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }

  Future post(String url,
      {String? body, Map<String, String>? headerSelected}) async {
    try {
      String urlCompleta = _baseUrl + url;
      final response = await http.post(Uri.parse(urlCompleta),
          body: body, headers: headerSelected ?? headers);
      VerifyResponse.verifyResponse(response);
      return response;
    } on CustomException catch (e) {
      throw CustomException(errorMessage: e.errorMessage);
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }

  Future put(String url,
      {String? body, Map<String, String>? headerSelected}) async {
    try {
      String urlCompleta = _baseUrl + url;
      final response = await http.put(Uri.parse(urlCompleta),
          body: body, headers: headerSelected ?? headers);
      VerifyResponse.verifyResponse(response);
      return response;
    } on CustomException catch (e) {
      throw CustomException(errorMessage: e.errorMessage);
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }

  Future patch(String url,
      {String? body, Map<String, String>? headerSelected}) async {
    try {
      String urlCompleta = _baseUrl + url;
      final response = await http.patch(Uri.parse(urlCompleta),
          body: body, headers: headerSelected ?? headers);
      VerifyResponse.verifyResponse(response);
      return response;
    } on CustomException catch (e) {
      throw CustomException(errorMessage: e.errorMessage);
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }

  Future delete(String url, {Map<String, String>? headerSelected}) async {
    try {
      String urlCompleta = _baseUrl + url;
      final response = await http.delete(Uri.parse(urlCompleta),
          headers: headerSelected ?? headers);
      VerifyResponse.verifyResponse(response);
      return response;
    } on CustomException catch (e) {
      throw CustomException(errorMessage: e.errorMessage);
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }

  Future head(String url, {Map<String, String>? headerSelected}) async {
    try {
      String urlCompleta = _baseUrl + url;
      final response = await http.head(Uri.parse(urlCompleta),
          headers: headerSelected ?? headers);
      VerifyResponse.verifyResponse(response);
      return response;
    } on CustomException catch (e) {
      throw CustomException(errorMessage: e.errorMessage);
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }
}
