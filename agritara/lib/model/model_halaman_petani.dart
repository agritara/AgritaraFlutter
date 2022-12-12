// To parse this JSON data, do
//
//     final barangPetani = barangPetaniFromJson(jsonString);

import 'dart:convert';

List<BarangPetani> barangPetaniFromJson(String str) => List<BarangPetani>.from(
    json.decode(str).map((x) => BarangPetani.fromJson(x)));

String barangPetaniToJson(List<BarangPetani> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BarangPetani {
  BarangPetani({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory BarangPetani.fromJson(Map<String, dynamic> json) => BarangPetani(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.namaBarang,
    required this.kuantitasBarang,
    required this.daerahAsal,
    required this.date,
  });

  String namaBarang;
  int kuantitasBarang;
  DaerahAsal? daerahAsal;
  DateTime date;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        namaBarang: json["nama_barang"],
        kuantitasBarang: json["kuantitas_barang"],
        daerahAsal: daerahAsalValues.map[json["daerah_asal"]],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "nama_barang": namaBarang,
        "kuantitas_barang": kuantitasBarang,
        "daerah_asal": daerahAsalValues.reverse[daerahAsal],
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}

enum DaerahAsal { JAKARTA }

final daerahAsalValues = EnumValues({"Jakarta": DaerahAsal.JAKARTA});

enum Model { ADD_ITEM_BARANGPETANI }

final modelValues =
    EnumValues({"add_item.barangpetani": Model.ADD_ITEM_BARANGPETANI});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
