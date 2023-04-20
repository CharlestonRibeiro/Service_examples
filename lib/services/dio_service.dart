import 'package:dio/dio.dart';
import 'package:services/services/custom_exception.dart';

class DioService {
  final Dio _dio = Dio();
  final String _baseUrl = 'Colocar aqui a URL';

  DioService() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = 5000 as Duration?; // 5 seconds
    _dio.options.receiveTimeout = 5000 as Duration?; // 5 seconds
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
  }

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }

  Future<Response<dynamic>> post(String url, {dynamic data}) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }

  Future<Response<dynamic>> put(String url, {dynamic data}) async {
    try {
      final response = await _dio.put(url, data: data);
      return response;
    } on DioError catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }

  Future<Response<dynamic>> patch(String url, {dynamic data}) async {
    try {
      final response = await _dio.patch(url, data: data);
      return response;
    } on DioError catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }
}
