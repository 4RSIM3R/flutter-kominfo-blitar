import 'dart:async';

import 'package:dio/dio.dart';

class Wrapper<T> {
  Future<T> wrap(Future<T> Function() futureFunction) async {
    try {
      final result = await futureFunction();
      return result;
    } catch (e) {
      if (e is DioError) {
        throw Exception("Api Errr");
      } else {
        rethrow;
      }
    }
  }

  Future<void> wrapBloc(StreamController<T> controller, Future<T> Function() futureFunction) async {
     try {
      final response = await futureFunction();
      controller.add(response);
    } catch (error) {
      controller.addError(error);
    }
  }

}

// Class Wrapper<T anything>, Wrapper<String>
// Function Future<T>, wrap, Fu
