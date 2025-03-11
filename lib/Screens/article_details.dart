import 'package:flutter/material.dart';
import 'package:forms/models/article.dart';

class ArticleDetailsPage extends StatelessWidget {
  final Article article;

  const ArticleDetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Article details"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              article.title,
              style: TextStyle(fontSize: 20),
            ),

            Text("By ${article.author}"),
            Text(article.date),
            Image.network(
              article.image,
            ),
            Text(article.details)
          ],
        ),
      ),
    );
  }
}
