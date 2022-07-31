import 'dart:convert';

import 'package:api/Data/api/api_service.dart';
import 'package:api/Data/model/article.dart';
import 'package:api/crud/delete.dart';
import 'package:api/crud/update.dart';
import 'package:api/ui/article_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget{

  final Datum article;

  ArticleDetailPage(this.article);

  ApiService api = ApiService();
  final _delete = GlobalKey<FormState>();

  void ShowAlertMethod(BuildContext context){
    var alert = AlertDialog(
      content: const Text('Hapus Data?'),
      actions: <Widget>[
        FlatButton(
          child: const Text('Yes'),
          onPressed: () {
            api.delete(article.id).then((success) {
              _delete.currentState!.save();
            });
            Navigator.push(context, new MaterialPageRoute(builder: (context)
            => new TourismListPage(doneTourismPlaceList: [])));
          },
        ),
        FlatButton(
          child: const Text('No'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return alert;
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(10);
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  '/update_data'
                );
              }
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              api.delete(article.id).then((success) {
                _delete.currentState!.save();
              });
              Navigator.pop(context);
            }
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Container(
                child: Image.network(article.imageAsset, height: 238, fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                article.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      Text(article.jamBuka),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      Text(article.waktu),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.paid),
                      Text(article.tiket),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                article.deskripsi,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(article.listImage1),
                    ),
                  ),
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(article.listImage2),
                    ),
                  ),
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(article.listImage3),
                    ),
                  ),
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(article.listImage4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}