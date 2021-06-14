import 'package:chatapp/components/chat.dart';
import 'package:flutter/material.dart';

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
        if (constraints.maxWidth > 1200) {
          return Scaffold(
            backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
            body: Center(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight*0.9,
                      width: constraints.maxWidth*0.25,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("avatar.png"),
                            ),
                            title: Text(
                              "Goblu"
                            ),
                            subtitle: Container(
                              margin: EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                "Last Message!!"
                              ),
                            )
                          );
                        }
                      )
                    ),
                    SizedBox(
                      height: constraints.maxHeight*0.9,
                      width: constraints.maxWidth*0.55,
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(backgroundImage: AssetImage('avatar.png'),),
                            title: Text("Goblu", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                            subtitle: Container(child: Text("online", style: TextStyle(color: Colors.white),), margin: EdgeInsets.symmetric(vertical: 4.0)),
                            trailing: IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}, color: Colors.white,),
                            tileColor: Colors.deepPurpleAccent,
                          ),
                          ChatPage(),
                        ],
                      )
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return ChatPage();
        }
      },
    );
  }
}