import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prectice/screen/news/controller/news_controller.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsController controller = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    controller.newsGet();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News Application"),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.news.value == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.news.value!.articlesList!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed('detail',arguments:controller.news.value!.articlesList![index] );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: ([...Colors.primaries]..shuffle()).first,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl: controller.news.value!
                                          .articlesList![index].urlToImage ==
                                      null
                                  ? "https://etimg.etb2bimg.com/thumb/msid-95166011,width-1200,resizemode-4/.jpg"
                                  : "${controller.news.value!.articlesList![index].urlToImage}",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  Image.network("https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg",height:300,
                                    width: double.infinity,fit: BoxFit.cover,), // Add this
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 190,
                                    child: Text(
                                      "${controller.news.value!.articlesList![index].author}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.visible,
                                      maxLines: 2,
                                    )),
                                SizedBox(
                                    width: 270,
                                    child: Text(
                                      "${controller.news.value!.articlesList![index].title}",
                                      style: const TextStyle(fontSize: 15),
                                      overflow: TextOverflow.visible,
                                      maxLines: 2,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
