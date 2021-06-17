import 'package:flutter/material.dart';

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