import 'package:dio/dio.dart';

class NetworkSource {
  static Dio dio() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: 'https://mock.apidog.com/m1/361910-0-default',
      connectTimeout: Duration(seconds: 5),
      sendTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    );

    return dio;
  }

  static Dio mockDio() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: 'https://mock.apidog.com/m1/361910-0-default',
      connectTimeout: Duration(seconds: 5),
      sendTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    );

    return dio;
  }
}
