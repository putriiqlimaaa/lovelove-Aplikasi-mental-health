import 'package:flutter/material.dart';

class privacy extends StatelessWidget {
  const privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Kebijakan Privasi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink[300],
        foregroundColor: Colors.black,
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  "Apa yang dimaksud Kebijakan Privasi dan apa yang dicakup di dalamnya?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Kami di perusahaan LoveLove ingin Anda memahami informasi apa yang kami kumpulkan, serta bagaimana kami menyimpannya. Kami menganjurkan supaya Anda membaca Kebijakan Privasi kami. Hal ini membantu Anda menggunakan aplikasi LoveLove dengan cara yang benar bagi Anda.",
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Berapa lama kami menyimpan informasi Anda?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Kami menyimpan informasi selama kami membutuhkannya untuk menyediakan akses Aplikasi kami. Berikut adalah hal yang kami pertimbangkan saat mengambil keputusan :",
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ">  Jika kami membutuhkannya untuk mengoperasikan atau menyediakan aplikasi kami. Misalnya, kami perlu menyimpan beberapa informasi Anda untuk mengelola akun Anda.",
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  ">  Jika kami membutuhkannya untuk tujuan lain yang sah, seperti untuk mencegah bahaya; menyelidiki kemungkinan pelanggaran terhadap ketentuan atau kebijakan kami; atau melindungi diri kami sendiri, termasuk hak, properti, atau aplikasi kami.",
                  style: TextStyle(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 180,
                ),
                Center(
                  child: Text(
                    'Berlaku 11 November 2023',
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ]))),
    );
  }
}
