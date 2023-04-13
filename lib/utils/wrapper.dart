import 'package:dio/dio.dart';

class Wrapper<T> {
  Future<T> wrap(Future<T> Function() futureFunction) async {
    try {
      final result = await futureFunction();
      return result;
    } catch (e) {
      if (e is DioError && e.response!.statusCode == 400) {
        throw Exception("Api Errr");
      } else {
        rethrow;
      }
    }
  }
}
