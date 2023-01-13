import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pam_lab4/domain/model/article.dart';
import 'package:pam_lab4/domain/model/paginated-response.dart';
import 'package:pam_lab4/domain/usecase/articles-use-case.dart';
import 'package:pam_lab4/presentation/home/Module/featured.dart';
//scroll column
class HomeController extends GetxController {
  final ArticlesUseCase articlesUseCase;

  RxList<Featured> featured = RxList();
  RxList<Article> articles = RxList();
  ScrollController articlesScrollController = ScrollController();
  int _totalArticlesPages = 1;
  int _currentArticlesPage = 0;

  HomeController({
    required this.articlesUseCase
  });

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onClose() {
    articlesScrollController.dispose();
  }

  void loadData() async {
    if (_totalArticlesPages == _currentArticlesPage) {
      return;
    } else {
      _currentArticlesPage += 1;
    }

    await readJsonFile();

    try {
      PaginatedResponse<Article> response = await articlesUseCase.getArticles(_currentArticlesPage);
      articles.addAll(response.items);
      _totalArticlesPages = response.totalPages;
    } catch (e) {
      log("Failed fetch to articles: $e");
    }
  }

  Future<void> readJsonFile() async {
    final String jsonString = await rootBundle.loadString('assets/news.json');
    final data = await json.decode(jsonString);

    featured.value = (data ['featured'] as List).map((value) => Featured.fromJson(value)).toList();
  }
}