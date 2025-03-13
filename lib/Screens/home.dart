import 'package:flutter/material.dart';
import 'package:forms/models/article.dart';
import 'package:forms/providers/bookmarks_provider.dart';
import 'package:forms/widgets/article_widget.dart';
import 'package:forms/utils/dummy_article_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles = DummyArticleProvider.getDummyArticle();

  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider(
        create: (context) => BookmarksProvider(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
            actions: [Consumer<BookmarksProvider>(builder: (context, provider, child) => IconButton(onPressed: () => {}, icon: Icon(Icons.bookmarks,color: provider.isEmpty()?Colors.grey:Colors.orangeAccent,)),)],
          ),
          body: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) =>
                ArticleWidget(article: articles[index]),
          ),
        ),
      );
  }
}
