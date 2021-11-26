import 'package:flutter/material.dart';

class CustomerField extends StatelessWidget {
  const CustomerField({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: onChanged,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
