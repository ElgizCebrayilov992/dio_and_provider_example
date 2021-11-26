import 'package:dio/dio.dart';

final dio = Dio()
  ..options = BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com/',
    contentType: 'application/json',
  );
