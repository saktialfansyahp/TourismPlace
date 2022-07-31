import 'package:api/Data/api/api_service.dart';
import 'package:api/Data/model/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api/ui/article_detail_page.dart';

import '../ui/article_list_page.dart';

class CardArticle extends StatelessWidget {
  final Datum article;
  final bool isDone;
  final Function(bool? value) onCheckboxClick;

  const CardArticle({
    required this.article,
    required this.isDone,
    required this.onCheckboxClick,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      color: isDone ? Colors.white60 : Colors.white,
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
          Checkbox(
            checkColor: Colors.blueAccent,
            value: isDone,
            onChanged: onCheckboxClick,
          )
        ],
      ),
    );
  }
}