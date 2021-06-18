import 'package:chatapp/components/chatviewsettings.dart';
import 'package:chatapp/controller/chat.dart';
import 'package:flutter/material.dart';
import 'chat.dart';

// ignore: must_be_immutable
class ChatView extends StatelessWidget {
  final height;
  final width;
  final id;
  
  ChatView({
    Key? key, this.height, this.width, this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ChatController controller = ChatController();

    return SizedBox(
      height: height,
      width: width,
      child: FutureBuilder(
        future: controller.getChat(id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            final data = snapshot.data;
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(data['avatar']),),
                  title: Text(data['name'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                  subtitle: Container(child: Text("online", style: TextStyle(color: Colors.white),), margin: EdgeInsets.symmetric(vertical: 4.0)),
                  trailing: IconButton(icon: Icon(Icons.more_vert), onPressed: () {}, color: Colors.white,),
                  tileColor: Colors.deepPurpleAccent,
                ),
                Expanded(
                  child: ChatPage(messages: data['messages'],)
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
        ,
      );
  }
}