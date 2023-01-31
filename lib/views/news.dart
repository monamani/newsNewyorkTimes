import 'package:flutter/material.dart';
import 'package:news/views/articleTile.dart';
import 'package:news/model/article.dart';

class NewsPage extends StatefulWidget {
  final List<Articles>? newslist;

  NewsPage({this.newslist});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text("NY Times Most Popular"),
      ),
      body: Center(
          child: widget.newslist!.isNotEmpty
              ? Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: widget.newslist!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ArticleTile(
                          articleDetails: widget.newslist![index],
                        );
                      }),
                )
              : Text("Sorry no news here")),
    );
  }
}
