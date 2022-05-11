class Rocket {
  String? rocketName;
  String? rocketType;
  String? engineType;
  String? engineLayout;
  String? company;
  String? country;
  double? costPerLaunch;
  String? rocketId;

  Rocket({
    this.rocketId,
    this.rocketName,
    this.rocketType,
    this.engineType,
    this.engineLayout,
    this.company,
    this.country,
    this.costPerLaunch,
  });

  factory Rocket.fromJson(dynamic json) {
    return Rocket(
      rocketId: json['rocket']['id'] ?? json['rocket']['id'].toString(),
      rocketName: json['rocket']['name'] ?? json['rocket']['name'].toString(),
      rocketType:
          json['rocket_type'] ?? json['rocket']['engines']['type'].toString(),
      engineType: json['rocket']['engines']['type'] ??
          json['rocket']['engines']['type'].toString(),
      engineLayout: json['rocket']['engines']['layout'] ??
          json['rocket']['engines']['layout'].toString(),
      company:
          json['rocket']['company'] ?? json['rocket']['company'].toString(),
      country:
          json['rocket']['country'] ?? json['rocket']['country'].toString(),
      costPerLaunch: json['rocket']['cost_per_launch'].toDouble() ??
          json['rocket']['cost_per_launch'].toDouble(),
    );
  }
}
