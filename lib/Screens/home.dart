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
  List<Article> articles=DummyArticleProvider.getDummyArticle();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: ListView.builder(itemCount: articles.length, itemBuilder:(context, index) => ArticleWidget(article: articles[index]),),
      ),
    );
  }
}
