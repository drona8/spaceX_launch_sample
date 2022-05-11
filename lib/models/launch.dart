import 'package:sampleapp/models/rocket.dart';
import 'package:sampleapp/models/ship.dart';

class Launch {
  String id;
  String launchName;
  String launchDate;
  Rocket? rocket;
  List<Ship>? ships;

  Launch({
    required this.id,
    required this.launchName,
    required this.launchDate,
    this.rocket,
    this.ships,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'] ?? json['id'].toString(),
      launchName: json['mission_name'] ?? json['mission_name'].toString(),
      launchDate: json['launch_date_local'] ?? json['launch_date_local'],
      rocket: json['rocket'] != null ? _getRocket(json['rocket']) : null,
      ships: json['ships'] != null ? _getShips(json['ships']) : null,
    );
  }

  static List<Ship> _getShips(dynamic jsonShip) {
    return List<dynamic>.from(jsonShip).map((ship) {
      Ship s = Ship.fromJson(ship);
      return s;
    }).toList();
  }

  static Rocket _getRocket(dynamic jsonRocket) {
    return Rocket.fromJson(jsonRocket);
  }
}
