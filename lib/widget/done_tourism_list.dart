import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/model/article.dart';

class DoneTourismList extends StatelessWidget{
  final List<Datum> doneTourismPlaceList;
  const DoneTourismList({
    Key? key,
    required this.doneTourismPlaceList
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Telah Dikunjungi'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          final Datum article = doneTourismPlaceList[index];
          return Card(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.network(article.imageAsset, height: 75, fit: BoxFit.cover),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          article.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(article.location),
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.done_outline),
              ],
            ),
          );
        },
        itemCount: doneTourismPlaceList.length,
      ),
    );
  }

}