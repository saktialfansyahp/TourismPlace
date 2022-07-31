import 'package:api/Data/api/api_service.dart';
import 'package:api/Data/model/article.dart';
import 'package:api/crud/add_data.dart';
import 'package:api/crud/update.dart';
import 'package:api/ui/article_detail_page.dart';
import 'package:api/ui/article_list_page.dart';
import 'package:api/ui/article_web_view.dart';
import 'package:api/ui/nyobak.dart';
import 'package:flutter/material.dart';

import 'crud/delete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => TourismListPage(doneTourismPlaceList: [],),
        '/article_web': (context) =>
            ArticleWebView(
              url: ModalRoute.of(context)?.settings.arguments as String
            ),
        '/article_detail': (context) =>
            ArticleDetailPage(
                ModalRoute.of(context)?.settings.arguments as Datum
            ),
        '/add_data': (context) =>
            AddData(

            ),
        '/update_data': (context) =>
            Update(

            ),
        '/delete_data': (context) =>
            DeleteData(

            ),
      },
    );
  }
}