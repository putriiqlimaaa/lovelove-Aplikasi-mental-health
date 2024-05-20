import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  const setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[300],
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.pink[300],
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                "Notification Settings",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SwitchListTile(
                  value: true,
                  title: Text("Received Notification"),
                  onChanged: (val) {}),
              SwitchListTile(
                  value: true,
                  title: Text("Received Notification"),
                  onChanged: (val) {}),
            ],
          ),
        ),
      ),
    );
  }
}
