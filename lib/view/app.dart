import 'package:dio_and_provider_example/providers/auth_change_notifier.dart';
import 'package:dio_and_provider_example/view/pages/auth/auth_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/post_view/post_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthChangeNotifier()..checkAuth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthPage(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(
                builder: (context) => const PostView(),
              );
            default:
              return MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Wrong Page'),
                  ),
                  body: const Center(
                    child: Text('Sorry'),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}

/**
  
 ChangeNotifierProvider<PostChangeNotifier>(
        create: (context) => PostChangeNotifier()..getPostList(),
        child: const PostView(),
      )
 */