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
                launch_date_local
              }
            }        
      ''';

  static const getLauncheDetails = r'''
              query Launch($launchId: ID!) {
                launch(id: $launchId) {
                  id
                  mission_name
                  launch_date_local
                  rocket {
                    rocket_name
                    rocket_type
                    rocket {
                      company
                      cost_per_launch
                      country
                      engines {
                        type
                        layout
                      }
                      id
                      name
                    }
                  }
                  ships {
                    home_port
                    id
                    image
                    mmsi
                    name
                    status
                  }
                }
              }        
      ''';
}
