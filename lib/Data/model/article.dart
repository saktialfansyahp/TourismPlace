// To parse this JSON data, do
//
//     final tourismPlaceResults = tourismPlaceResultsFromJson(jsonString);

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class TourismPlaceResults {
  TourismPlaceResults({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory TourismPlaceResults.fromRawJson(String str) => TourismPlaceResults.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TourismPlaceResults.fromJson(Map<String, dynamic> json) => TourismPlaceResults(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.location,
    required this.imageAsset,
    required this.listImage1,
    required this.listImage2,
    required this.listImage3,
    required this.listImage4,
    required this.deskripsi,
    required this.jamBuka,
    required this.tiket,
    required this.waktu,
  });

  String id;
  String name;
  String location;
  String imageAsset;
  String listImage1;
  String listImage2;
  String listImage3;
  String listImage4;
  String deskripsi;
  String jamBuka;
  String tiket;
  String waktu;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    location: json["location"],
    imageAsset: json["imageAsset"],
    listImage1: json["listImage1"],
    listImage2: json["listImage2"],
    listImage3: json["listImage3"],
    listImage4: json["listImage4"],
    deskripsi: json["deskripsi"],
    jamBuka: json["jamBuka"],
    tiket: json["tiket"],
    waktu: json["waktu"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "location": location,
    "imageAsset": imageAsset,
    "listImage1": listImage1,
    "listImage2": listImage2,
    "listImage3": listImage3,
    "listImage4": listImage4,
    "deskripsi": deskripsi,
    "jamBuka": jamBuka,
    "tiket": tiket,
    "waktu": waktu,
  };
}
