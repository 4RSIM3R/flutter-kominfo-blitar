import 'dart:async';

import 'package:flutter_training/model/info_model.dart';
import 'package:flutter_training/service/info_service.dart';
import 'package:flutter_training/sources/network_source.dart';

class InfoBloc {
  final StreamController<InfoModel> _controller = StreamController<InfoModel>();
  Stream<InfoModel> get _stream => _controller.stream;

  Future<void> fetchData() async {
    try {
      final response = await InfoService(NetworkSource.dio()).getInfo();
      _controller.add(response);
    } catch (error) {
      _controller.addError(error);
    }
  }
}
