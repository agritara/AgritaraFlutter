// from Quicktype
// To parse this JSON data, do
//
//     final fields = fieldsFromJson(jsonString);

import 'dart:convert';

List<Fields> fieldsFromJson(String str) => List<Fields>.from(json.decode(str).map((x) => Fields.fromJson(x)));

String fieldsToJson(List<Fields> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fields {
  Fields({
    required this.namaBarang,
    required this.kuantitasBarang,
    this.daerahAsal = "Jakarta",
    required this.date
  });

  String namaBarang;
  int kuantitasBarang;
  String daerahAsal;
  String date;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    namaBarang: json["nama_barang"],
    kuantitasBarang: json["kuantitas_barang"],
    daerahAsal: json["daerah_asal"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "nama_barang": namaBarang,
    "kuantitas_barang": kuantitasBarang,
    "daerah_asal": daerahAsal,
    "date": date,
  };
}
