import 'package:chatapp/components/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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

class ChatView extends StatelessWidget {
  final height;
  final width;
  
  const ChatView({
    Key? key, this.height, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage('avatar.png'),),
            title: Text("Goblu", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            subtitle: Container(child: Text("online", style: TextStyle(color: Colors.white),), margin: EdgeInsets.symmetric(vertical: 4.0)),
            trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}, color: Colors.white,),
            tileColor: Colors.deepPurpleAccent,
          ),
          Expanded(child: ChatPage()),
        ],
      )
    );
  }
}

class Chats extends StatelessWidget {
  final height;
  final width;
  
  const Chats({
    Key? key, this.height, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
            leading: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: CircleAvatar(backgroundImage: AssetImage('avatar.png'),)
            ),
            trailing: Wrap(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.chat), color: Colors.white,),
                SizedBox(width: 5.0,),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert), color: Colors.white,),
                SizedBox(width: 5.0,)
              ]
            ),
            tileColor: Colors.deepPurpleAccent,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage("avatar.png"),),
                  title: Text("Goblu"),
                  subtitle: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "Last Message!!"
                    ),
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/chatview", arguments: {
                    height: height,
                    width: width
                  }),
                );
              }
            ),
          ),
        ],
      )
    );
  }
}