import 'package:dio_and_provider_example/providers/post_change_notifier.dart';
import 'package:dio_and_provider_example/view/pages/post_view/widgets/customer_card.dart';
import 'package:dio_and_provider_example/view/pages/post_view/widgets/customer_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<PostChangeNotifier>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomerField(
            onChanged: (value) {},
          ),
          Consumer<PostChangeNotifier>(
            builder: (context, value, child) {
              if (value.isProgress) {
                return const Center(child: CircularProgressIndicator());
              }

              return Expanded(
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                  itemCount: value.list.length,
                  itemBuilder: (context, index) {
                    
                    return CustomerCard(
                        userId: value.list[index].userId.toString(),
                        id: value.list[index].id.toString(),
                        title: value.list[index].title.toString(),
                        body: value.list[index].body.toString());
                  },
              ),
                ),
              );
            },
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
/*
Consumer<PostChangeNotifier>(builder: (context, value, child) {
              return FutureProvider(
                create: (context) =>
                   list,
                initialData: value.list,
                builder: (context, child) {
                  print(value.list.length);
                  return Text('data');
                },
              );
            }),
*/