import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'user_model.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;

  const UserDetailsPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    String about =
        "Here is Some details about ${user.firstName}. This is to demonstrate how Hero widget works in Flutter. And I Must say it quite amazing. We should appreciate Flutter team for building such a good Ui";
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: themeData.primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: "avatar${user.id}",
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user.avatar),
                ),
              ),
              Hero(
                tag: "username${user.id}",
                child: new Text(
                  "${user.firstName} ${user.firstName}",
                  style: themeData.textTheme.headline4,
                ),
              ),
              Hero(
                tag: "email${user.id}",
                child: new Text(
                  "${user.email}",
                  style: themeData.textTheme.subtitle2,
                ),
              ),
              new Text(
                "ZXR#M${user.id}",
                style: themeData.textTheme.subtitle2,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                        tag: "divider${user.id}",
                        child: Container(
                          width: 3,
                          color: Theme.of(context).secondaryHeaderColor,
                          height: 200,
                          margin: EdgeInsets.all(20),
                        )),
                    Expanded(
                        child: Text(
                      "$about ",
                      style: themeData.textTheme.bodyText1,
                      softWrap: true,
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
