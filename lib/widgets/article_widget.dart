import 'package:flutter/material.dart';
import 'package:forms/models/article.dart';
import 'package:forms/Screens/article_details.dart';

class ArticleWidget extends StatefulWidget{
  final Article article;
  bool isBookmarked;
  Function(Article) toggleBookmark;

  ArticleWidget({super.key, required this.article, required this.isBookmarked, required this.toggleBookmark});

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
                IconButton(onPressed: () => widget.toggleBookmark(widget.article), icon: Icon(widget.isBookmarked?Icons.bookmark:Icons.bookmark_border),),
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