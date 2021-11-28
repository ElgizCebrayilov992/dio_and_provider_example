import 'package:dio/dio.dart';
import 'package:dio_and_provider_example/data/data_sources/dio_config.dart';
import 'package:dio_and_provider_example/data/models/post_model.dart';

class PostDataSource {
  
   Future<List<PostModel>> getAllPostList() async {
      
    try {
      Response result = await dio.get('/posts');
     
      return (result.data as List).map((e) => PostModel.fromJson(e)).toList();
    } catch (e, s) {
      // ignore: avoid_print
      print('Salam $e => $s');
    }
    return [];
  }
}
