import 'sectorDistrict.dart';

class Employee {
  int id;
  String code;
  String postalCode;
  String firstname;
  String lastname;
  String login;
  String address;
  String city;
  String phone;
  String releaseDate;
  String entryDate;
  Employee leader;
  SectorDistrict sectorDistrict;

  Employee(
      {this.id,
      this.code,
      this.postalCode,
      this.firstname,
      this.lastname,
      this.login,
      this.address,
      this.city,
      this.phone,
      this.releaseDate,
      this.entryDate,
      this.leader,
      this.sectorDistrict});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['id'],
        code: json['code'],
        postalCode: json['postalCode'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        login: json['login'],
        address: json['address'],
        city: json['city'],
        phone: json['phone'],
        releaseDate: json['releaseDate'],
        entryDate: json['entryDate'],
        leader:
            json['leader'] == null ? Employee.fromJson(json['leader']) : null,
        sectorDistrict: SectorDistrict.fromJson(json['sectorDistrict']));
  }
}
