import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hero_widget/user_details_page.dart';
import 'package:flutter_hero_widget/user_model.dart';
import 'package:flutter_hero_widget/user_repository.dart';

class ListingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListingPageState();
}

class ListingPageState extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("Users"),
      ),
      body: FutureBuilder<Response>(
        builder: (context, snap) {
          if (snap.hasData) {
            UserModel userModel = UserModel.fromJson(snap.data.data);
            if (userModel.users.isEmpty) {
              return Center(
                child: Text("No User found"),
              );
            } else {
              List<User> userList = userModel.users;
              return ListView.builder(
                itemBuilder: (context, index) {
                  User user = userList[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserDetailsPage(
                                  user: user,
                                ))),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Column(
                        children: [
                          ListTile(
                            title: Hero(tag: "username${user.id}",child: Text("${user.firstName}  ${user.lastName}")),
                            subtitle: Hero(tag: "email${user.id}",child: Text("${user.email} ")),
                            trailing: Hero(tag: "avatar${user.id}",
                              child: CircleAvatar(
                                backgroundImage: NetworkImage("${user.avatar}"),
                              ),
                            ),
                          ),
                          Hero(
                            tag: "divider${user.id}",
                            child: Divider(
                              color: Theme.of(context).secondaryHeaderColor,
                              indent: 20,
                              endIndent: 80,
                              thickness: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: userList.length,
              );
            }
          }
          return Center(
            child: Text("Loading"),
          );
        },
        future: UserRepository().getUsers(),
      ),
    );
  }
}
