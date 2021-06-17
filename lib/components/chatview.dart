import 'package:chatapp/components/chatviewsettings.dart';
import 'package:flutter/material.dart';
import 'chat.dart';

// ignore: must_be_immutable
class ChatView extends StatelessWidget {
  var height;
  var width;
  
  ChatView({
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