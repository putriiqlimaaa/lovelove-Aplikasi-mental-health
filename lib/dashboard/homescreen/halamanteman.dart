import 'package:flutter/material.dart';
import 'package:lovelove/dashboard/homescreen/teman.dart';

class FriendDetailsScreen extends StatelessWidget {
  final teman friend; //mengambil dari class teman

  FriendDetailsScreen({required this.friend});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[300],
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.pink[300],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(friend.image!),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                friend.nama!,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                friend.quotes!,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.white),
                    textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 100,
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.red,
                  ),
                ),
                title: Text(friend.join!),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.red,
                  ),
                ),
                title: Text(friend.info!),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.date_range,
                    color: Colors.red,
                  ),
                ),
                title: Text(friend.lahir!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
