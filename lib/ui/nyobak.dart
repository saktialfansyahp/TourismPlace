import 'package:api/Data/api/api_service.dart';
import 'package:api/ui/article_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/model/article.dart';
import '../crud/delete.dart';

class Nyobak extends StatelessWidget{
  ApiService api = ApiService();
  static const routeName = '/article_detail';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)?.settings.arguments as Datum;
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                bool response = await api.delete(article.id);
                if (response){

                }else{
                  print('Delete data failed');
                }
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: article.location.length,
                itemBuilder: (countext, index) {
                  return Padding(
                    padding: EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(''),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}