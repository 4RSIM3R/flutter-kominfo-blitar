import 'package:flutter/material.dart';

class ReactiveInfoPage extends StatefulWidget {
  const ReactiveInfoPage({super.key});

  @override
  State<ReactiveInfoPage> createState() => _ReactiveInfoPageState();
}

class _ReactiveInfoPageState extends State<ReactiveInfoPage> {

  

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
