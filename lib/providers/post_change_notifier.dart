import 'package:dio_and_provider_example/data/data_sources/post_data_source.dart';
import 'package:dio_and_provider_example/data/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostChangeNotifier extends ChangeNotifier {
  List<PostModel> list = [];
  late PostDataSource postDataSource;
  bool isProgress = true;
  PostChangeNotifier() {
    postDataSource = PostDataSource();
  }
  getPostList() async {
    isProgress = true;
    notifyListeners();

    list = await postDataSource.getAllPostList();
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool('logged', true);
    

    Future.delayed(const Duration(seconds: 6), () {
      if (list.isNotEmpty) {
        isProgress = false;
      }
      notifyListeners();
    });
  }
}
