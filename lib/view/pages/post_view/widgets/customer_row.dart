import 'package:flutter/material.dart';

class CustomerRow extends StatelessWidget {
  const CustomerRow({Key? key, required this.title, required this.info})
      : super(key: key);
  final String title, info;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: IntrinsicHeight(
          child: Row(
            children:  [Text('$title :  '), Expanded(child: Text(info))],
          ),
        ),
      ),
    );
  }
}
