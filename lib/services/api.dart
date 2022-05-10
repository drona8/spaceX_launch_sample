import 'dart:io';

import 'package:graphql/client.dart';
import 'package:sampleapp/models/launch.dart';

import '../utilities/client_utility.dart';

class Api {
  static Future<Launch> getLaunchById(String id) async {
    final GraphQLClient _client = ClientUtility.getGithubGraphQLClient();
    final QueryResult _result =
        await _client.query(ClientUtility.getQueryOptionWithId(id));
    if (_result.hasException) {
      print('Got Some Exception');
      print(_result.exception.toString());
      exit(2);
    }
    return Launch.fromJson(_result.data!['launch']);
  }
}
