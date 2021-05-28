import 'dart:convert';

import 'sector.dart';

class SectorDistrict {
  int id;
  String name;
  Sector sector;

  SectorDistrict({this.id, this.name, this.sector});

  factory SectorDistrict.fromJson(Map<String, dynamic> json) {
    return SectorDistrict(
        id: json['id'],
        name: json['name'],
        sector: Sector.fromJson(json['sector']));
  }
}
