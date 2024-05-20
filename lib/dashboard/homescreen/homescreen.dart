import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lovelove/dashboard/akun/menu/aboutus.dart';
import 'package:lovelove/dashboard/akun/menu/privacy.dart';
import 'package:lovelove/dashboard/akun/menu/profile.dart';
import 'package:lovelove/dashboard/homescreen/teman.dart';
import 'package:lovelove/dashboard/homescreen/halamanteman.dart';
import 'package:lovelove/login.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  static List<teman> main_teman_list = [
    teman(
      image: "assets/image/tinkerbell.jpg",
      nama: "tinkerbell",
      quotes: 'Tetap tersenyum',
      jarak: '5 m',
      join: '13 November 2023',
      info: 'People Pleaser',
      lahir: '12 Oktober 2005',
    ),
    teman(
      image: "assets/image/air.jpg",
      nama: 'air',
      quotes: 'tenang seperti air',
      jarak: '500 m',
      join: '17 November 2023',
      info: 'Tidak banyak bicara',
      lahir: '08 Desember 2004',
    ),
    teman(
      image: "assets/image/watermelon.jpg",
      nama: 'watermelon sugar',
      quotes: 'if you never try, you will never know',
      jarak: '300 m',
      join: '13 November 2023',
      info: 'Mudah menyerah',
      lahir: '04 Januari 2003',
    ),
    teman(
      image: "assets/image/peri.jpg",
      nama: 'simsalabim',
      quotes: 'look at all the beauty in yourlife and be happy',
      jarak: '400 m',
      join: '13 November 2023',
      info: 'Menunggu keajaiban',
      lahir: '25 Juni 2004',
    ),
    teman(
      image: "assets/image/kelinci.jpg",
      nama: 'rabbit',
      quotes: 'you are your home',
      jarak: '450 m',
      join: '13 November 2023',
      info: 'Stuck ditempat',
      lahir: '19 Februari 2005',
    ),
  ];

  List<teman> display_list = List.from(main_teman_list); //mengambil list dari main_teman_list

  void updatelist(String value) {
    setState(() {
      display_list = main_teman_list //display_list menyimpannya
          .where((element) => //difilter berdasarkan nama
              element.nama!.toLowerCase().contains(value.toLowerCase()))
          .toList(); //adalah daftar dari hasil filter yang diubah
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.pink[300],
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Hai, Love',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 17,
          ),
          AspectRatio(
            aspectRatio: 336 /
                184, //mengambil widget anak (mengatur ukuran widget dengan rasio yang ditentukan)
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Stack(
                //widdget yang memungkin untuk membuat widget-widget saling bertumpukan
                children: [
                  Image.asset(
                    'assets/image/love.jpg',
                    height: double.maxFinite,
                    width: double.maxFinite,
                    fit: BoxFit
                        .cover, //membuat gambar sesuai dengan ukuran latar
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 21,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
            child: TextFormField(
              style: TextStyle(fontSize: 16, color: Colors.white),
              onChanged: (value) => updatelist(value), //mengambil updatelist yakni dari nama
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: 'Temukan teman...',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[100],
                    height: 150 / 100),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: display_list.length == 0 //kalau nama yang dicari tidak ada
                ? Center(
                    child: Text(
                    'Tidak menemukan teman yang dicari',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ))
                : ListView.builder(
                    itemCount: display_list.length,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].nama!,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          display_list[index].quotes!,
                          style: TextStyle(color: Colors.white60),
                        ),
                        trailing: Text(
                          "${display_list[index].jarak}",
                          style: TextStyle(color: Colors.amber),
                        ),
                        leading: Image.asset(display_list[index].image!),
                        onTap: () { //untuk membuka profile teman
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FriendDetailsScreen( //melihat profile teman dengan mengambil di halamanteman
                                    friend: display_list[index],
                                  )));
                        }),
                  ),
          ),
        ]),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.pink[300],
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    'LoveLove',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(CupertinoIcons.person),
                  title: Text(
                    'Profile',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => profile()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(Icons.privacy_tip_outlined),
                  title: Text(
                    'Kebijakan Privasi',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => privacy()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(Icons.info_outline_rounded),
                  title: Text(
                    'About Us',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => aboutus()));
                  },
                ),
              ),
              SizedBox(
                height: 270,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => login()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
