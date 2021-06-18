import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'components/allchats.dart';
import 'components/chatview.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (kIsWeb) {
          return Scaffold(
            backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
            body: Center(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chats(height: constraints.maxHeight*0.9, width: constraints.maxWidth*0.25),
                    ChatView(height: constraints.maxHeight*0.9, width: constraints.maxWidth*0.55)
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(
              child: Chats(
                height: constraints.maxHeight, 
                width: constraints.maxWidth,
              )
            ),
          );
        }
      },
    );
  }
}



