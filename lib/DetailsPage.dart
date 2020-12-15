import 'package:flutter/material.dart';
import 'package:json_serialization/Model/NewsModel.dart';

class DetailsPage extends StatelessWidget {
  final Article article;

  DetailsPage({
    Key key,
    @required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
                tag: '${article.title}',
                child: Image.network(
                    article.urlToImage ?? AssetImage('images/not.png'))),
            Text(
              article.title ?? 'NA',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(article.content ?? 'NA',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text(article.description ?? 'NA',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            Text(article.url ?? 'NA',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.blue)),
            Text('${article.publishedAt}' ?? 'NA')
          ],
        ),
      ),
    );
  }
}
