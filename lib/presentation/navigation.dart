import 'package:get/get.dart';
import 'package:pam_lab4/domain/usecase/articles-use-case.dart';
import 'package:pam_lab4/presentation/details/details-controller.dart';
import 'package:pam_lab4/presentation/details/details-page.dart';
import 'package:pam_lab4/presentation/home/home-controller.dart';
import 'package:pam_lab4/presentation/home/home-page.dart';

class Navigation {

  static const String ROUTE_HOME = "/home";
  static const String ROUTE_DETAILS = "/details/:articleId";

  static List<GetPage<dynamic>> pages() {
    return [
      GetPage(
        name: ROUTE_HOME,
        page: () => const HomePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<HomeController>(
            () => HomeController(articlesUseCase: Get.find<ArticlesUseCase>())
          );
        })
      ),
      GetPage(
        name: ROUTE_DETAILS,
        page: () => const DetailsPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<DetailsController>(
            () => DetailsController(
              articleId: Get.parameters["articleId"],
              articlesUseCase: Get.find<ArticlesUseCase>()
            )
          );
        })
      )
    ];
  }

  static String toDetails(int articleId) {
    return ROUTE_DETAILS.replaceAll(":articleId", articleId.toString());
  }
}