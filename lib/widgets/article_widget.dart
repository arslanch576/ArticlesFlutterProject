import 'package:flutter/material.dart';
import 'package:forms/models/article.dart';
import 'package:forms/Screens/article_details.dart';

class ArticleWidget extends StatelessWidget{
  final Article article;

  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArticleDetailsPage(article: article),)),
      child: Row(
        children: [
          Expanded(child: Image.network(article.image,)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(article.title, style: TextStyle(fontSize: 20),),
                Text("By ${article.author}"),
                Text(article.date),
              ],
            ),
          )
        ],
      ),
    );
  }

}