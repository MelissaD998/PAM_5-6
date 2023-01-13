import 'package:get/get.dart';
import 'package:pam_lab4/common/api-service.dart';
import 'package:pam_lab4/data/datasource/remote/article-remote-data-source.dart';
import 'package:pam_lab4/data/repository/article-repository-impl.dart';
import 'package:pam_lab4/domain/repository/article-repository.dart';
import 'package:pam_lab4/domain/usecase/articles-use-case.dart';

class DIInitializer {

  static Future init() async {
    Get.put(ApiService());
    Get.put(ArticleRemoteDataSource(apiService: Get.find<ApiService>()));
    Get.put<ArticleRepository>(ArticleRepositoryImpl(articleRemoteDataSource: Get.find<ArticleRemoteDataSource>()));
    Get.put(ArticlesUseCase(articleRepository: Get.find<ArticleRepository>()));
  }
}
//access.from other component