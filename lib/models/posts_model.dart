// To parse this JSON data, do
//
//     final temperatures = temperaturesFromMap(jsonString);

import 'dart:convert';

List<Temperatures> temperaturesFromMap(String str) => List<Temperatures>.from(json.decode(str).map((x) => Temperatures.fromMap(x)));

String temperaturesToMap(List<Temperatures> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Temperatures {
  String name;
  String city;

  Temperatures({
    required this.name,
    required this.city,
  });

  factory Temperatures.fromMap(Map<String, dynamic> json) => Temperatures(
    name: json["name"],
    city: json["city"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "city": city,
  };
}