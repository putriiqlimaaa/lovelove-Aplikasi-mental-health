import 'package:flutter/material.dart';
import 'package:lovelove/dashboard.dart';
import 'package:lovelove/theme.dart';

class selamatdatang extends StatelessWidget {
  const selamatdatang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Selamat datang, Love.',
              style: TextStyle(
                color: pinkTua,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => dashboard()));
              },
              child: Container(
                height: 60,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      pinkMuda,
                      pinkTua,
                    ])),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "LOGIN",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
