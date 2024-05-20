import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aboutus extends StatelessWidget {
  const aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'About Us',
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
                  Text(
                    "What is LoveLove?",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "LoveLove adalah sebuah aplikasi mental health yang bertujuan untuk membantu para penggunanya lebih memberi waktu untuk dirinya sendiri.",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Di aplikasi LoveLove tersedia lagu yang layak untuk didengar dan sudah melalui proses pemilihan. Dan tersedia pula menu menulis tiap harinya sebagai apresiasi diri.",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "LoveLove dirintis mulai tahun 2023 di Lhokseumawe oleh Putri Iqlima, berawal dari sebuah pelajaran membuat aplikasi mobile.",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 240,
                  ),
                  Center(
                    child: Text(
                      "About Us",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      "LoveLove Studio 2023",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ]
              )
            )
          )
        );
  }
}
