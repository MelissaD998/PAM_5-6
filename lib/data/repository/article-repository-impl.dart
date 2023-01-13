import 'package:pam_lab4/data/datasource/remote/article-remote-data-source.dart';
import 'package:pam_lab4/data/model/article-model.dart';
import 'package:pam_lab4/data/model/pagination-response.dart';
import 'package:pam_lab4/domain/model/article.dart';
import 'package:pam_lab4/domain/model/paginated-response.dart';
import 'package:pam_lab4/domain/repository/article-repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {

  final ArticleRemoteDataSource articleRemoteDataSource;

  ArticleRepositoryImpl({
    required this.articleRemoteDataSource
  });

  @override
  Future<PaginatedResponse<Article>> getAll(int page) async {
    final PaginationResponse response = await articleRemoteDataSource.getArticles(page);

    return PaginatedResponse( //list->page
      totalPages: response.total_pages,
      items: ArticleModel.fromJsonList(response.results).map((e) => e.toDomain()).toList()
    );
  }

  @override
  Future<Article> getById(String id) async { //elem in page
    return (await articleRemoteDataSource.getArticle(id)).toDomain();
  }
}