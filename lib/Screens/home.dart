import 'package:flutter/material.dart';
import 'package:forms/models/article.dart';
import 'package:forms/widgets/article_widget.dart';
import 'package:forms/utils/dummy_article_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles = DummyArticleProvider.getDummyArticle();
  List<Article> bookmarks = [];

  void toggleBookmark(Article article){
    setState(() {
      if(bookmarks.contains(article)){
        bookmarks.remove(article);
      }else{
        bookmarks.add(article);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.bookmarks,color: bookmarks.isEmpty?Colors.grey:Colors.orangeAccent,))],
        ),
        body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) =>
              ArticleWidget(article: articles[index],isBookmarked: bookmarks.contains(articles[index]),toggleBookmark: toggleBookmark,),
        ),
      );
  }
}
