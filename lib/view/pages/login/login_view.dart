import 'package:dio_and_provider_example/view/globals/customer_action_button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const decoration = InputDecoration(border: OutlineInputBorder());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: decoration.copyWith(hintText: 'Username'),
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              decoration: decoration.copyWith(hintText: 'Password'),
            ),
            const SizedBox(
              height: 6,
            ),
            CustomerActionButton(
              title: 'Log in',
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              buttonSize: ButtonSize.medium,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
