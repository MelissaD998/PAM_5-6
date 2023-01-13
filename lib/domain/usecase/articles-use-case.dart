import 'package:pam_lab4/domain/model/article.dart';
import 'package:pam_lab4/domain/model/paginated-response.dart';
import 'package:pam_lab4/domain/repository/article-repository.dart';

class ArticlesUseCase {

  final ArticleRepository articleRepository;

  ArticlesUseCase({
    required this.articleRepository
  });

  Future<PaginatedResponse<Article>> getArticles(int page) async {
    return articleRepository.getAll(page);
  }

  Future<Article> getArticle(String id) async {
    return await articleRepository.getById(id);
  }
}
//return of entities, ->page