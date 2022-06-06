import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_tile.dart';

import '../model/article_model.dart';
import '../services/api.dart';
import '../widgets/appBar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.newsCategory}) : super(key: key);

  final String newsCategory;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  ArticleServices articleServices=ArticleServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ArticleModel>(
                future: articleServices.getArticleCategories(widget.newsCategory),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    // ignore: avoid_print
                    print(snapshot.error);
                    return Text("${snapshot.error}");
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        return NewsTile(
                          imgUrl:
                          "${snapshot.data!.articles![index].image}",
                          title: "${snapshot.data!.articles![index].title}",
                          description:
                          "${snapshot.data!.articles![index].description}",
                          postUrl: "${snapshot.data!.articles![index].url}",
                        );
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
