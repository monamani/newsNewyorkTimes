import 'package:flutter/material.dart';
import 'package:news/views/articleView.dart';
import 'package:news/model/article.dart';

class ArticleDetails extends StatefulWidget {
  final Articles? articleDetails;
  ArticleDetails({Key? key, this.articleDetails}) : super(key: key);
  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            '${widget.articleDetails?.title}',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (widget.articleDetails!.media!.isNotEmpty)
                if (widget.articleDetails!.media?[0].type == "image")
                  if (widget.articleDetails!.media?[0].mediaMetadata != null)
                    Hero(
                      tag: "${widget.articleDetails?.id}",
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(1),
                          child: Image.network(
                            "${widget.articleDetails!.media![0].mediaMetadata![2].url}",
                            fit: BoxFit.cover,
                          )),
                    ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${widget.articleDetails?.title}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${widget.articleDetails?.byline}",
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "${widget.articleDetails?.publishedDate}",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "${widget.articleDetails?.abstractDes}",
                        style: TextStyle(
                            color: Colors.black,
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticleView(
                                        articleTitle:
                                            widget.articleDetails?.title,
                                        articleUrl: widget.articleDetails?.url,
                                      )));
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            color: Colors.black,
                            child: Text(
                              "Read More",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
