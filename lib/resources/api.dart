import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/globals.dart';

import 'package:news/model/article.dart';

class NewsAPI {
  List<Articles> news = [];

  Future<void> getArticles() async {
    var url = Uri.https(
        'api.nytimes.com',
        '/svc/mostpopular/v2/mostviewed/all-sections/7.json',
        {'api-key': apiKey});

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "OK") {
      jsonData["results"].forEach((element) {
        news.add(Articles.fromJson(Map<String, dynamic>.from(element)));
      });
    }
  }
}
