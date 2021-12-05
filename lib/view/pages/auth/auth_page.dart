import 'package:dio_and_provider_example/providers/auth_change_notifier.dart';
import 'package:dio_and_provider_example/view/pages/login/login_view.dart';
import 'package:dio_and_provider_example/view/pages/post_view/post_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AuthState>(
        stream: context.read<AuthChangeNotifier>().authStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == AuthState.authenticated) {
              return const PostView();
            }else  if (snapshot.data == AuthState.unauthenticated) {
              return const LoginView( );
            }else{
              return const Checking();
            }
          }
          return const Checking();
        },
      ),
    );
  }
}

class Checking extends StatelessWidget {
  const Checking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      stepWidth: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Checking auth'),
          SizedBox(
            height: 20.0,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
/*

Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:const [
            Text('Checking auth'),
            SizedBox(height: 20.0,),
            CircularProgressIndicator()
          ],
        )
*/