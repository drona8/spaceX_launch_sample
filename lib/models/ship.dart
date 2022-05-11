class Ship {
  String? homePort;
  String? id;
  String? image;
  int? mmsi;
  String? name;
  String? status;

  Ship({
    required this.id,
    required this.homePort,
    required this.image,
    this.mmsi,
    required this.name,
    required this.status,
  });

  factory Ship.fromJson(dynamic json) {
    return Ship(
      id: json['id'] ?? json['id'].toString(),
      homePort: json['home_port'] ?? json['home_port'].toString(),
      image: json['image'] ?? json['image'].toString(),
      mmsi: json['mmsi'] ?? json['mmsi'],
      name: json['name'] ?? json['name'].toString(),
      status: json['status'] ?? json['status'].toString(),
    );
  }
}
