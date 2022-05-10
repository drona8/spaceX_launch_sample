class Launch {
  String id;
  String launchName;
  String launchDate;
  List<String>? rocketFirstStageCoreStatus;

  Launch(
      {required this.id,
      required this.launchName,
      required this.launchDate,
      this.rocketFirstStageCoreStatus});

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'] ?? json['id'].toString(),
      launchName: json['mission_name'] ?? json['mission_name'].toString(),
      launchDate: json['launch_date_local'] ?? json['launch_date_local'],
      rocketFirstStageCoreStatus:
          _getRocketFirstStageCoreStatus(json['rocket'] ?? json['rocket']),
    );
  }

  static List<String>? _getRocketFirstStageCoreStatus(
      Map<String, dynamic>? json) {
    List<String>? _list;
    if (json != null) {
      if (json['first_stage'] != null) {
        if (json['first_stage']['cores'] != null) {
          List<dynamic> _cores = json['first_stage']['cores'] as List<dynamic>;
          _list = List.from(json['first_stage']['cores']);
        }
      }
    }
    return _list;
  }
}
