import 'package:chatapp/dashboard.dart';
import 'package:flutter/material.dart';
import 'components/chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      home: Dashboard(),
      routes: {
        '/chatview': (context) => Scaffold(body: SafeArea(child: ChatView(),),) 
      },
    );
  }
}

