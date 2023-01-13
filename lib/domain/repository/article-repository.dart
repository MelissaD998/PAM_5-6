import 'package:pam_lab4/domain/model/article.dart';
import 'package:pam_lab4/domain/model/paginated-response.dart';

abstract class ArticleRepository {
  Future<PaginatedResponse<Article>> getAll(int page);
  Future<Article> getById(String id);
}
//call endpoints return