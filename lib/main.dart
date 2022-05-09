import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:sampleapp/utilities/client_utility.dart';

import 'models/launch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SpaceX Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: _onPressed,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _isLoading
                      ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text("Press Me!!"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() async {
    setState(() {
      _isLoading = true;
    });
    final GraphQLClient _client = ClientUtility.getGithubGraphQLClient();
    final QueryResult _result =
        await _client.query(ClientUtility.getQueryOption());
    if (_result.hasException) {
      stderr.writeln('Got Some Exception');
      stderr.writeln(_result.exception.toString());
      exit(2);
    }
    setState(() {
      _isLoading = false;
    });
    final List<Launch> _launches = (_result.data!['launches'] as List)
        .map((data) => Launch.fromJson(data))
        .toList();
    print('The no of launches ' + _launches.length.toString());
  }
}
