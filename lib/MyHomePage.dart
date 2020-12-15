import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:json_serialization/DetailsPage.dart';
import 'package:json_serialization/Model/NewsModel.dart';
import 'package:json_serialization/Services/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<NewsModel> _newsModel;
  @override
  void initState() {
    _newsModel = News_Model_API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWS MODEL'),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.articles.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data.articles[index];
                    // var image =
                    //     article.urlToImage != null ? article.urlToImage : '';
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                        article: article,
                                      )));
                        },
                        leading: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            child: AspectRatio(
                                aspectRatio: 2,
                                child: Hero(
                                    tag: '${article.title}',
                                    child: Image.network(article.urlToImage ??
                                        AssetImage('images/not.png'))))),
                        title: Text(
                          article.title ?? 'NA',
                          style: TextStyle(color: Colors.blue),
                        ),
                        subtitle: Text(
                          '${article.publishedAt} ' ?? 'NA',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
