import 'package:flutter/material.dart';
import 'package:prectice/screen/detail/view/detail_screen.dart';
import 'package:prectice/screen/news/view/news_screen.dart';

Map<String,WidgetBuilder> app_routes={
  '/': (context)=> const NewsScreen(),
  'detail':(context)=> const DetailScreen(),
};