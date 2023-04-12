import 'package:dio/dio.dart';

class NetworkSource {
  static Dio dio() {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: 'https://mock.apidog.com/m1/361910-0-default',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    return dio;
  }
}
