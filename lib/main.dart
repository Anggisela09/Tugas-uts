import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/list_page.dart';
import 'pages/detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTS Mobile',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/list': (context) => ListPage(),
        '/detail': (context) => DetailPage(),
      },
    );
  }
}
