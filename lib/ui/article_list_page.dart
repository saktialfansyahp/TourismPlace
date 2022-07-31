import 'dart:convert';

import 'package:api/Data/api/api_service.dart';
import 'package:api/Data/model/article.dart';
import 'package:api/crud/add_data.dart';
import 'package:api/ui/article_detail_page.dart';
import 'package:api/ui/nyobak.dart';
import 'package:api/widget/card_article.dart';
import 'package:api/widget/done_tourism_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TourismListPage extends StatefulWidget{

  final List<Datum> doneTourismPlaceList;
  const TourismListPage({
    Key? key,
    required this.doneTourismPlaceList
  }) : super(key: key);
  @override
  _TourismListPageState createState() => _TourismListPageState(doneTourismPlaceList);
}

class _TourismListPageState extends State<TourismListPage> {
  late Future<TourismPlaceResults> _article;
  final List<Datum> doneTourismPlaceList;

  @override
  void initState(){
    super.initState();
    _article = ApiService().topHeadlines();
  }

  _TourismListPageState(this.doneTourismPlaceList);

  Widget _buildList(BuildContext context){
    return FutureBuilder(
      future: _article,
      builder: (BuildContext context, AsyncSnapshot <TourismPlaceResults> snapshot){
        var state = snapshot.connectionState;
        if (state != ConnectionState.done){
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.data.length,
              itemBuilder: (context, index) {
                var article = snapshot.data?.data[index];
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(
                      context,
                      Nyobak.routeName,
                      arguments: article,
                    );
                  },
                  child: FutureBuilder(
                    builder: (context, AsyncSnapshot<TourismPlaceResults> snapshot){
                      return CardArticle(
                        article: article!,
                        isDone: doneTourismPlaceList.contains(article),
                        onCheckboxClick: (bool? value){
                          setState(() {
                            if(value!=null){
                              value
                                  ? doneTourismPlaceList.add(article)
                                  : doneTourismPlaceList.remove(article);
                            }
                          });
                        },
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Text('');
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Surabaya'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done_outline),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context){
                  return DoneTourismList(
                      doneTourismPlaceList: doneTourismPlaceList);
                }),);
            }
          )
        ],
      ),
      body: _buildList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddData.routeName,
          ).then((AddData) => setState(() {}));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}