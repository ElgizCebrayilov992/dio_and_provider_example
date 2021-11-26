import 'package:dio_and_provider_example/data/data_sources/post_data_source.dart';
import 'package:dio_and_provider_example/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostChangeNotifier extends ChangeNotifier {
  List<PostModel> list = [];
  late PostDataSource postDataSource;
  bool isProgress = false;
  bool isSuccess = false;
  PostChangeNotifier() {
    postDataSource = PostDataSource();
  }
  getPostList() async {
    isProgress = true;
    notifyListeners();
    list = await postDataSource.getAllPostList();

    if (list.isNotEmpty) {
      isProgress = false;
      isProgress = true;
    }
    notifyListeners();
  }
}
