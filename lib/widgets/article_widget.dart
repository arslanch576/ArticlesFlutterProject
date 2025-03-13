import 'package:flutter/material.dart';
import 'package:forms/models/article.dart';
import 'package:forms/Screens/article_details.dart';
import 'package:forms/providers/bookmarks_provider.dart';
import 'package:provider/provider.dart';

class ArticleWidget extends StatefulWidget{
  final Article article;

  ArticleWidget({super.key, required this.article});

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleDetailsPage(article: widget.article),)),
      child: Row(
        children: [
          Expanded(child: Image.network(widget.article.image,)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<BookmarksProvider>(builder: (context, provider, child) {
                  return IconButton(onPressed: () => provider.toggleBookmark(widget.article), icon: Icon(provider.isBookmarked(widget.article)?Icons.bookmark:Icons.bookmark_border),);
                },),
                Text(widget.article.title, style: TextStyle(fontSize: 20),),
                Text("By ${widget.article.author}"),
                Text(widget.article.date),
              ],
            ),
          )
        ],
      ),
    );
  }
}