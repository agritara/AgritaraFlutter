// from Quicktype
// To parse this JSON data, do
//
//     final inputPetani = inputPetaniFromJson(jsonString);

import 'dart:convert';
import 'fields_model.dart';

List<InputPetani> inputPetaniFromJson(String str) => List<InputPetani>.from(json.decode(str).map((x) => InputPetani.fromJson(x)));

String inputPetaniToJson(List<InputPetani> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InputPetani {
  InputPetani({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory InputPetani.fromJson(Map<String, dynamic> json) => InputPetani(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json[["fields"]]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}
