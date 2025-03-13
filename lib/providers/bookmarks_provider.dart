
import 'package:flutter/material.dart';

import '../models/article.dart';

class BookmarksProvider extends ChangeNotifier{
  List<Article> _bookmarks = [];

  void toggleBookmark(Article article){
      if(_bookmarks.contains(article)){
        _bookmarks.remove(article);
      }else{
        _bookmarks.add(article);
      }
      notifyListeners();
  }

  bool isBookmarked(Article a){
    return _bookmarks.contains(a);
  }

  bool isEmpty(){
    return _bookmarks.isEmpty;
  }


}
