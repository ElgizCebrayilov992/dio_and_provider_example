import 'package:flutter/material.dart';

import 'customer_row.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard(
      {Key? key,
      required this.userId,
      required this.id,
      required this.title,
      required this.body})
      : super(key: key);
  final String userId, id, title, body;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Column(
        children:  [
          CustomerRow(title: 'userId', info: userId),
          const Divider(),
          CustomerRow(title: 'id', info: id),
          const Divider(),
          CustomerRow(
              title: 'title',
              info:
                  title),
          const Divider(),
          CustomerRow(
              title: 'body',
              info:
                  body),
        ],
      ),
    );
  }
}
