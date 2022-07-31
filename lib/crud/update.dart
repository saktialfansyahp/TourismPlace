import 'package:api/Data/api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Data/model/article.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<Update> {
  final TextEditingController _controller = TextEditingController();
  late Future<Datum> _futureAlbum;
  ApiService api = ApiService();

  @override
  void initState() {
    super.initState();
    _futureAlbum = api.gettopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}