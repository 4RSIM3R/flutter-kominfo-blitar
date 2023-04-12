import 'package:flutter/material.dart';
import 'package:flutter_training/model/info_model.dart';
import 'package:flutter_training/service/info_service.dart';
import 'package:flutter_training/sources/network_source.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server Info"),
        centerTitle: true,
      ),
      body: FutureBuilder<InfoModel>(
        future: InfoService(NetworkSource.dio()).getInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data?.data?.title ?? "-"),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
