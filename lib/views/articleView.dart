import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String? articleUrl;
  final String? articleTitle;
  ArticleView({this.articleUrl, this.articleTitle});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool isLoading = false, viewContentLoaded = false;
  final _key = UniqueKey();

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            '${widget.articleTitle}',
          ),
        ),
        body: (isLoading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: <Widget>[
                  WebView(
                    key: _key,
                    onPageFinished: (String url) {
                      setState(() {
                        viewContentLoaded = true;
                        isLoading = false;
                      });
                    },
                    initialUrl: widget.articleUrl,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                  ),
                  (!viewContentLoaded)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center(),
                ],
              ));
  }
}
