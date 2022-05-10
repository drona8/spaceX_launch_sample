import 'package:graphql/client.dart';
import 'package:sampleapp/graphql/launch_query.dart';

class ClientUtility {
  static const String spaceXEndPoint = 'https://api.spacex.land/graphql/';

  static GraphQLClient getGithubGraphQLClient() {
    final Link _link = HttpLink(
      spaceXEndPoint,
    );

    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }

  static QueryOptions getQueryOptionWithId(String id) {
    final QueryOptions options = QueryOptions(
      document: gql(
        LaunchQuery.getLaunches,
      ),
      variables: {
        "launchId": id,
      },
    );
    return options;
  }

  static QueryOptions getQueryOption() {
    final QueryOptions options = QueryOptions(
      document: gql(
        LaunchQuery.getAllLaunches,
      ),
    );
    return options;
  }
}
