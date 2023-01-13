import 'package:pam_lab4/common/api-service.dart';
import 'package:pam_lab4/data/model/article-model.dart';
import 'package:pam_lab4/data/model/pagination-response.dart';

class ArticleRemoteDataSource {
  final ApiService apiService;

  ArticleRemoteDataSource({required this.apiService});

  Future<PaginationResponse> getArticles(int page) async {  //all
    final dynamic json = (await apiService.get("articles?page=$page")).body;
    return PaginationResponse.fromJson(json);
  }

  Future<ArticleModel> getArticle(String articleId) async { //new page
    final dynamic json = (await apiService.get("articles/$articleId")).body;
    return ArticleModel.fromJson(json);
  }
}
//method