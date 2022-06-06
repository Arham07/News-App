import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_tile.dart';
import '../model/article_model.dart';
import '../services/api.dart';
import '../widgets/news_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ArticleServices articleServices=ArticleServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              'tify',
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
         CategoryTile(),
          Expanded(
            child: FutureBuilder<ArticleModel>(
                future: articleServices.getArticle(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    print("error occured");
                    return const Text('');
                  } else {
                    return ListView.builder(
                      // shrinkWrap: true,
                      itemCount: snapshot.data!.articles!.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var list = snapshot.data!.articles![index];
                        if (list.description != null && list.image != null) {
                          return NewsTile(
                            imgUrl: "${list.image}",
                            title: "${list.title}",
                            description: "${list.description}",
                            postUrl: "${list.url}",
                          );
                        } else {
                          return const Text("aada");
                        }
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


