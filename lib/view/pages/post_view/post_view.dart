import 'package:dio_and_provider_example/providers/post_change_notifier.dart';
import 'package:dio_and_provider_example/view/pages/post_view/widgets/customer_card.dart';
import 'package:dio_and_provider_example/view/pages/post_view/widgets/customer_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  PostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomerField(
            onChanged: (value) {},
          ),
          Expanded(
            child:
                Consumer<PostChangeNotifier>(builder: (context, value, child) {
              return FutureProvider(
                create: (context) =>context.read<PostChangeNotifier>().getPostList(),
                initialData: value.list,
                builder: (context, child) {},
              );
            }),
          )
        ],
      ),
    );
  }
}
/**
 * 
 * 
 * 
  ListView.builder(
                itemCount: value.list.length,
                itemBuilder: (context, index) {
                  print(value.list.length);
                  return CustomerCard(
                      userId: value.list[index].userId.toString(),
                      id: value.list[index].id.toString(),
                      title: value.list[index].title.toString(),
                      body: value.list[index].body.toString());
                },
              )
 */