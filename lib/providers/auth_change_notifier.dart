import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState { inital, authenticated, unauthenticated }

class AuthChangeNotifier extends ChangeNotifier {
  late final sharedPrefs;
  final _authStreamController = StreamController<AuthState>()
    ..add(AuthState.inital);
  Stream<AuthState> get authStream => _authStreamController.stream;

  void checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    try {
      sharedPrefs = await SharedPreferences.getInstance();
      final authenticated = sharedPrefs.getBool('logged');

      if (authenticated != null && authenticated) {
        _authStreamController.add(AuthState.authenticated);
      } else {
        _authStreamController.add(AuthState.unauthenticated);
      }
    } catch (e, s) {
      // ignore: avoid_print
      print('$e => $s');

      _authStreamController.add(AuthState.unauthenticated);
    }
  }

  void setExit() {
    try {
      sharedPrefs.remove('logged');

      _authStreamController.add(AuthState.unauthenticated);
    } catch (e, s) {
      print('$e => $s');
    }
  }

  @override
  void dispose() {
    _authStreamController.close();
    super.dispose();
  }
}
