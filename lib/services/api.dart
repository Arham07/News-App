import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/article_model.dart';

class ArticleServices{

  Future<ArticleModel> getArticle() async {
    // var client = http.Client();
    var response = await http.get(Uri.parse(
        "https://gnews.io/api/v4/top-headlines?country=us&token=b8581258c2bb0d8c51a6e6fc16a96451"));
    if (response.statusCode == 200) {
      // ignore: avoid_print
      return ArticleModel.fromJson(jsonDecode(response.body.toString()));
    } else {
      throw Exception("Error in service url");
    }
  }

  Future<ArticleModel> getArticleCategories(topic) async {
    // var client = http.Client();
    var response = await http.get(Uri.parse(
        "https://gnews.io/api/v4/top-headlines?country=us&topic=$topic&token=b8581258c2bb0d8c51a6e6fc16a96451"));
    if (response.statusCode == 200) {
      // ignore: avoid_print
      return ArticleModel.fromJson(jsonDecode(response.body.toString()));
    } else {
      throw Exception("Error in service url");
    }
  }

}