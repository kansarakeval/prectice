import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prectice/screen/news/controller/news_controller.dart';
import 'package:prectice/screen/news/model/news_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  NewsController controller = Get.put(NewsController());
  ArticlesModel model = Get.arguments ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: model.urlToImage ==
                      null
                      ? "https://etimg.etb2bimg.com/thumb/msid-95166011,width-1200,resizemode-4/.jpg"
                      : "${model.urlToImage}",
                  height:300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                  Image.network("https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg",height:300,
                    width: double.infinity,fit: BoxFit.cover,), // Add this
                ),
              ),
              SizedBox(height: 10,),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Name : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    TextSpan(text: " ${model.sourceModel!.name}",style: TextStyle(fontSize: 20)),
                  ]
              ),),
              SizedBox(height: 10,),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Title : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    TextSpan(text: " ${model.title}",style: TextStyle(fontSize: 20)),
                  ]
              ),),
              SizedBox(height: 10,),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Description : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    TextSpan(text: " ${model.description}",style: TextStyle(fontSize: 20)),
                  ]
              ),),
              SizedBox(height: 10,),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Content : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    TextSpan(text: " ${model.content}",style: TextStyle(fontSize: 20)),
                  ]
              ),),
              SizedBox(height: 10,),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "PublishedAt : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    TextSpan(text: " ${model.publishedAt}",style: TextStyle(fontSize: 20)),
                  ]
              ),),
              SizedBox(height: 10,),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: "Author : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    TextSpan(text: " ${model.author}",style: TextStyle(fontSize: 20)),
                  ]
              ),),
            ],
          ),
        ),
      ),
    ));
  }
}
