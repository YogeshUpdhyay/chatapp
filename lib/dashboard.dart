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
            backgroundColor: Colors.deepPurpleAccent,
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
                      child: ChatPage()
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(child: Text("Phone"),);
        }
      },
    );
  }
}