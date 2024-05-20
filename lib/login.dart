import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lovelove/login%20dan%20registrasi/layarlogin.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => layarlogin()), (route) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //memperluas atau menempati seluruh layar perangkat
      body: Center(
          child:
              Hero(tag: "Logo", child: Image.asset('assets/image/love.jpg'))),
    );
  }
}
