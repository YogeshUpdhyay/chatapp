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
            body: Container(
              margin: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth*0.05,
                vertical: constraints.maxHeight*0.05
              ),
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight*0.9,
                      width: constraints.maxWidth*0.25,
                      child: ListView(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png"
                              ),
                            ),
                            title: Text(
                              "Goblu"
                            ),
                            subtitle: Text(
                              "Last Message!!"
                            ),  
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://www.nicepng.com/png/detail/186-1866063_dicks-out-for-harambe-sample-avatar.png"
                              ),
                            ),
                            title: Text(
                              "Goblu"
                            ),
                            subtitle: Text(
                              "Last Message!!"
                            ),  
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://www.nicepng.com/png/detail/186-1866063_dicks-out-for-harambe-sample-avatar.png"
                              ),
                            ),
                            title: Text(
                              "Goblu"
                            ),
                            subtitle: Text(
                              "Last Message!!"
                            ),  
                          ),
                        ],
                      ),
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