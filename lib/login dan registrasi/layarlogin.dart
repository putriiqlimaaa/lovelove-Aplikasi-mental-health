import 'package:flutter/material.dart';
import 'package:lovelove/dashboard.dart';
import 'package:lovelove/login%20dan%20registrasi/signup.dart';
import 'package:lovelove/theme.dart';

class layarlogin extends StatefulWidget {
  const layarlogin({super.key});

  @override
  State<layarlogin> createState() => _layarloginState();
}

class _layarloginState extends State<layarlogin> {
  //untuk menindaknampakan password
  bool _obscureText = true;
  //untuk ketik user dan password
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //membuat kotak untuk memasukkan username
    Widget _buildusername() {
      return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            //membuat bayangan kotak
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          )
        ]),
        child: TextFormField(
          controller: user,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(Icons.person_outline),
            hintText: 'Enter your username',
          ),
        ),
      );
    }

    Widget _buildPassword() {
      return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          )
        ]),
        child: TextFormField(
          controller: pass,
          obscureText: _obscureText,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.lock_outline_rounded),
              hintText: 'Enter your password',
              suffixIcon: GestureDetector(
                //untuk bisa membuat password terlihat dan tidak
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              )),
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 220),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
                ),
                SizedBox(height: 10),
                Text(
                  'Please sign in to continue',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                ),
                SizedBox(
                  height: 25,
                ),
                _buildusername(),
                SizedBox(
                  height: 20,
                ),
                _buildPassword(),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => dashboard()));
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [
                                pinkMuda,
                                pinkTua,
                              ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    signup())); //ke sign up untuk daftar dulu
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: pinkTua,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
