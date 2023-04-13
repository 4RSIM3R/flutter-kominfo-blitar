import 'dart:async';

import 'package:flutter_training/services/auth_service.dart';
import 'package:flutter_training/sources/network_source.dart';
import 'package:flutter_training/utils/wrapper.dart';

enum LoginState { init, loading, success, failure }

class LoginBloc {
  LoginBloc() {
    _state.sink.add(LoginState.init);
  }

  final _state = StreamController<LoginState>();
  Stream<LoginState> get state => _state.stream;

  Future<void> login(Map<String, dynamic> payload) async {
    _state.sink.add(LoginState.init);
    try {
      await AuthService(NetworkSource.dio()).doLogin(payload);
      _state.sink.add(LoginState.success);
    } catch (e) {
      _state.sink.add(LoginState.failure);
    }
  }
}
