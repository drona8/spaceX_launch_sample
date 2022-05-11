import 'package:sampleapp/models/ship.dart';

class Launch {
  String id;
  String launchName;
  String launchDate;
  List<String>? rocketFirstStageCoreStatus;
  List<Ship>? ships;

  Launch({
    required this.id,
    required this.launchName,
    required this.launchDate,
    this.rocketFirstStageCoreStatus,
    this.ships,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'] ?? json['id'].toString(),
      launchName: json['mission_name'] ?? json['mission_name'].toString(),
      launchDate: json['launch_date_local'] ?? json['launch_date_local'],
      rocketFirstStageCoreStatus:
          _getRocketFirstStageCoreStatus(json['rocket'] ?? json['rocket']),
      ships: json['ships'] != null ? _getShips(json['ships']) : null,
    );
  }

  static List<Ship> _getShips(dynamic jsonShip) {
    return List<dynamic>.from(jsonShip).map((ship) {
      Ship s = Ship.fromJson(ship);
      return s;
    }).toList();
  }

  static List<String>? _getRocketFirstStageCoreStatus(
      Map<String, dynamic>? json) {
    List<String>? _list;
    if (json != null) {
      if (json['first_stage'] != null) {
        if (json['first_stage']['cores'] != null) {
          _list = [];
          for (dynamic dyn in List.from(json['first_stage']['cores'])) {
            if (dyn['core'] != null) {
              if (dyn['core']['status'] != null) {
                _list.add(dyn['core']['status']);
              }
            }
          }
        }
      }
    }
    return _list;
  }
}
