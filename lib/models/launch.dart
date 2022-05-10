class Launch {
  String id;
  String launchName;
  String launchDate;

  Launch({
    required this.id,
    required this.launchName,
    required this.launchDate,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'] ?? json['id'].toString(),
      launchName: json['mission_name'] ?? json['mission_name'].toString(),
      launchDate: json['launch_date_local'] ?? json['launch_date_local'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['mission_name'] = launchName;
    data['launch_date_local'] = launchDate;
    return data;
  }
}
