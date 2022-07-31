import 'package:api/Data/api/api_service.dart';
import 'package:api/Data/model/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteData extends StatefulWidget{
  static const routeName = '/delete_data';

  @override
  State<StatefulWidget> createState() => _deleteData();

}

class _deleteData extends State<DeleteData>{

  ApiService api = ApiService();
  late Datum article;

  Future<void> OpenDialog() async {
    switch (await showDialog(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          title: const Text('Hapus Data?'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () async {

              },
              child: const Text('Yes'),
            ),
          ],
        );
      }
    )){

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: (){
              OpenDialog();
            },
            icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}