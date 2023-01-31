import 'package:flutter/material.dart';
import 'package:news/views/articleDetails.dart';
import 'package:news/model/article.dart';

class ArticleTile extends StatelessWidget {
  final Articles articleDetails;

  const ArticleTile({Key? key, required this.articleDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleDetails(
                      articleDetails: articleDetails,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Card(
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      if (articleDetails.media!.isNotEmpty)
                        if (articleDetails.media?[0].type == "image")
                          Expanded(
                            flex: 2,
                            child: Hero(
                              tag: "${articleDetails.id}",
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    "${articleDetails.media![0].mediaMetadata![0].url}",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                articleDetails.title.toString(),
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(articleDetails.section.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  textAlign: TextAlign.left),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Text(
                                        "${articleDetails.byline}",
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "${articleDetails.publishedDate}",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: IconButton(
                              icon: Icon(
                                Icons.chevron_right,
                                color: Colors.grey,
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ArticleDetails(
                                              articleDetails: articleDetails,
                                            )));
                              }))
                    ],
                  ),
                ),
              ))),
    );
  }
}
