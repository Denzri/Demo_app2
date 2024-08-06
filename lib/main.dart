import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/user_list_screen.dart';
import 'screens/user_detail_screen.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/users': (context) => UserListScreen(),
        '/userDetail': (context) => UserDetailScreen(user: ModalRoute.of(context)!.settings.arguments as User),
      },
    );
  }
}
