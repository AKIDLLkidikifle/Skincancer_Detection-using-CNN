import 'package:flutter/material.dart';
import './model/article_model.dart';
import './news/news_service.dart';

class NewsProvider extends ChangeNotifier {
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  final NewsService _newsService = NewsService();

  Future<void> fetchTopHeadlines(catagory) async {
    _articles = await _newsService.fetchTopHeadlines(catagory);
    notifyListeners();
  }
}
