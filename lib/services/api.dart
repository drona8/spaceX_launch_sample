import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:graphql/client.dart';
import 'package:sampleapp/models/launch.dart';

import '../utilities/client_utility.dart';

class Api {
  static Future<Launch> getLaunchById(String id) async {
    final GraphQLClient _client = ClientUtility.getGithubGraphQLClient();
    final QueryResult _result =
        await _client.query(ClientUtility.getQueryOptionWithId(id));
    if (_result.hasException) {
      debugPrint('Got Some Exception ${_result.exception.toString()}');
    }
    return Launch.fromJson(_result.data!['launch']);
  }
}
