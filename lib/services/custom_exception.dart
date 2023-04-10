import 'dart:convert';

import 'package:http/http.dart';

class CustomException implements Exception {
  String? errorMessage;
  CustomException({this.errorMessage = ''});

  factory CustomException.fromHttpError({required int statusCode}) {
    switch (statusCode) {
      case 400:
        return CustomException(errorMessage: "Unable to process the request");
      case 401:
        return CustomException(
            errorMessage: "Unable to authenticate the request");
      case 403:
        return CustomException(errorMessage: "Access denied");
      case 302:
        return CustomException(errorMessage: "Token expired");
      default:
        return CustomException(errorMessage: "Something went wrong");
    }
  }
}

class VerifyResponse {
  static verifyResponse(Response response) {
    List<int> sucessStatus = [200, 201, 204, 202, 203, 205, 206, 207, 208, 226];
    if (sucessStatus.contains(response.statusCode)) {
      return jsonDecode(response.body);
    }
    throw CustomException.fromHttpError(statusCode: response.statusCode);
  }
}