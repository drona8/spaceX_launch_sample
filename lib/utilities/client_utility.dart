import 'package:graphql/client.dart';

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

  static QueryOptions getQueryOption() {
    final QueryOptions options = QueryOptions(
        document: gql(
      r'''
        query  {
          launches {
            id
            mission_name
            mission_id
            rocket {
              rocket_name
            }
            launch_site {
              site_name
            }
            launch_date_local
          }
        }
      ''',
    ));
    return options;
  }
}
