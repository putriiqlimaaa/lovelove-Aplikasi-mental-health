import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'My Profile',
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
                backgroundImage: AssetImage('assets/image/saya.jpg'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Viva La Vida",
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
                "'You Can If You Think You Can'",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.white),
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
                title: Text('Bergabung pada \n 12 November 2023'),
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
                title: Text('Info \n Kurang Mencintai Diri'),
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
                title: Text('Lahir \n 13 Juli 2004'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
