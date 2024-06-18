import 'package:get/get.dart';
import 'package:prectice/screen/news/model/news_model.dart';
import 'package:prectice/util/api_helper.dart';

class NewsController extends GetxController{
  Rxn<NewsModel> news = Rxn();

  Future<void> newsGet() async {
    NewsModel? m1 = await ApiHelper.helper.newsApi();
    news.value = m1;
  }
}