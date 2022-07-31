import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/article.dart';

class ApiService {
  static final String _getUrl = 'http://10.0.2.2/yok/restapi.php?function=get_tourismplace';
  static final String _insertUrl = 'http://10.0.2.2/yok/restapi.php?function=insert_tourismplace';
  static final String _updateUrl = 'http://10.0.2.2/yok/restapi.php?function=update_tourismplace';

  Future<TourismPlaceResults> topHeadlines() async {
    final response = await http.get(Uri.parse(_getUrl));
    if (response.statusCode == 200) {
      return TourismPlaceResults.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
  Future<Datum> gettopHeadlines() async {
    final response = await http.get(Uri.parse(_getUrl));
    if (response.statusCode == 200) {
      return Datum.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
  Future<TourismPlaceResults> CreatetopHeadlines(Datum datum) async {
    Map data = {
      'id': datum.id,
      'name': datum.name,
      'location': datum.location,
      "imageAsset": datum.imageAsset,
      'listImage1': datum.listImage1,
      'listImage2': datum.listImage2,
      'listImage3': datum.listImage3,
      'listImage4': datum.listImage4,
      'deskripsi': datum.deskripsi,
      'jamBuka': datum.jamBuka,
      'tiket': datum.tiket,
      'waktu': datum.waktu
    };
    final response = await http.post(Uri.parse(_insertUrl), body: data);
    if (response.statusCode == 200) {
      return TourismPlaceResults.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
  Future<bool> delete(String id) async {
    final response = await http.delete(Uri.parse(
        'http://10.0.2.2/yok/restapi.php?function=delete_tourismplace&id=' + id));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  Future<Datum> update(String id, Datum datum) async {
    Map data = {
      'id': datum.id,
      'name': datum.name,
      'location': datum.location,
      "imageAsset": datum.imageAsset,
      'listImage1': datum.listImage1,
      'listImage2': datum.listImage2,
      'listImage3': datum.listImage3,
      'listImage4': datum.listImage4,
      'deskripsi': datum.deskripsi,
      'jamBuka': datum.jamBuka,
      'tiket': datum.tiket,
      'waktu': datum.waktu
    };
    final response = await http.post(
      Uri.parse(_updateUrl + id),
      body: data
    );
    if (response.statusCode == 200) {
      return Datum.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update album.');
    }
  }

}