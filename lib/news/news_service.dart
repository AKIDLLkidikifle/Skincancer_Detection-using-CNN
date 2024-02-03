import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/article_model.dart';

class NewsService {
  final String apiKey = 'a71655dcfd8b48cdbbac954c7db1116d';

  Future<List<Article>> fetchTopHeadlines(catagory) async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=${catagory}&apiKey=${apiKey}'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> jsonArticles = jsonResponse['articles'];
      List<Article> articles = jsonArticles
          .map((dynamic articleJson) => Article.fromJson(articleJson))
          .toList();
      return articles;
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
