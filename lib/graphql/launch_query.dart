class LaunchQuery {
  static const getAllLaunches = r'''
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
      ''';

  static const getLaunches = r'''
              query Launch($launchId: ID!) {
                launch(id: $launchId) {
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
      ''';
}
