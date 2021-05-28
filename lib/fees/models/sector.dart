class Sector {
  int id;
  String name;
  int leader_id;

  Sector({this.id, this.name, this.leader_id});

  factory Sector.fromJson(Map<String, dynamic> json) {
    return Sector(
        id: json['id'], name: json['name'], leader_id: json['leader_id']);
  }
}
