import 'package:chatapp/controller/chat.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  final height;
  final width;
  
  Chats({
    Key? key, this.height, this.width,
  }) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  ChatController controller = ChatController();

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: widget.height,
      width: widget.width,
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
            child: FutureBuilder(
              future: controller.getChats(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
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
                        onTap: () {}
                      );
                    }
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
              
            ),
          ),
        ],
      )
    );
  }
}