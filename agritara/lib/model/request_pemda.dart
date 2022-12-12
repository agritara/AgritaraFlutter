

import 'dart:convert';

List<Requestan> requestanFromJson(String str) => List<Requestan>.from(json.decode(str).map((x) => Requestan.fromJson(x)));

String requestanToJson(List<Requestan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Requestan {
  Requestan({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Requestan.fromJson(Map<String, dynamic> json) => Requestan(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.request,
    required this.kuantitasReq,
    required this.requestDate,
  });

  String request;
  int kuantitasReq;
  DateTime requestDate;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    request: json["request"],
    kuantitasReq: json["kuantitas_req"],
    requestDate: DateTime.parse(json["request_date"]),
  );

  Map<String, dynamic> toJson() => {
    "request": request,
    "kuantitas_req": kuantitasReq,
    "request_date": "${requestDate.year.toString().padLeft(4, '0')}-${requestDate.month.toString().padLeft(2, '0')}-${requestDate.day.toString().padLeft(2, '0')}",
  };
}
