import 'package:dio/dio.dart';
import 'package:flutter_training/model/login_model.dart';
import 'package:flutter_training/sources/session_source.dart';
import 'package:flutter_training/utils/api_path.dart';
import 'package:flutter_training/utils/wrapper.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<LoginModel> doLogin(Map<String, dynamic> payload) async {
    return await Wrapper<LoginModel>().wrap(
      () async {
        final response = await dio.post(login, data: payload);
        final result = LoginModel.fromJson(response.data);
        await SessionSource().saveToken(result.data!.token!);
        return result;
      },
    );
  }


}
