import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prectice/screen/news/model/news_model.dart';
class ApiHelper{
  static ApiHelper helper = ApiHelper._();

  ApiHelper._();

  Future<NewsModel?> newsApi() async {
    String api = "https://newsapi.org/v2/everything?q=tesla&from=2024-05-14&sortBy=publishedAt&apiKey=de620253cac14886aff29ddd6e0f32ae";
    var respones = await  http.get(Uri.parse(api));
    if(respones.statusCode == 200){
     var json = jsonDecode(respones.body);
     NewsModel newsModel = NewsModel.mapToModel(json);
     return newsModel;
    }
    return null;
  }
}