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

  static QueryOptions getQueryOptionWithId(String id, String label) {
    final QueryOptions options = QueryOptions(
      document: gql(
        _getGQL(label),
      ),
      variables: {
        "launchId": id,
      },
    );
    return options;
  }

  static String _getGQL(String label) {
    switch (label) {
      case 'launch':
        return LaunchQuery.getLaunches;
      case 'launch_details':
        return LaunchQuery.getLauncheDetails;
      default:
        return LaunchQuery.getLaunches;
    }
  }
}
