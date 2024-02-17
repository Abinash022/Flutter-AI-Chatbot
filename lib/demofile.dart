import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DemoFile extends StatefulWidget {
  const DemoFile({super.key});

  @override
  State<DemoFile> createState() => _DemoFileState();
}

class _DemoFileState extends State<DemoFile> {
  @override
  void initState() {
    onGetData();
    super.initState();
  }

  onGetData() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.https('jsonplaceholder.typicode.com', '/b/7WI8'),
      );
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

      print(decodedResponse);
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
