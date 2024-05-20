import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lovelove/dashboard/akun/menu/aboutus.dart';
import 'package:lovelove/dashboard/akun/menu/privacy.dart';
import 'package:lovelove/dashboard/akun/menu/profile.dart';
import 'package:lovelove/dashboard/musik/musik_model.dart';
import 'package:lovelove/login.dart';

class musik extends StatefulWidget {
  musik({super.key});

  @override
  State<musik> createState() => _musikState();
}

class _musikState extends State<musik> {
  int currentMusic = 0; //untuk melacak musik yang sedang diputar
  final player = AudioPlayer(); //untuk mengelola pemutaran audio
  Duration maxDuration = Duration(seconds: 0); //untuk memulai dari detik nol
  late ValueListenable<Duration>
      progress; //untuk mendengarkan perubahan nilai secara sinkron, juga untuk menampilkan kemajuan audio

  @override
  Widget build(BuildContext context) {
    getMaxDuration() {
      //untuk mrmbuat tomnol play hidup
      player.getDuration().then((value) {
        maxDuration = value ?? Duration(seconds: 0); //memulai dari detik nol
        print(maxDuration);
        setState(() {});
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          color: Colors.pink[300],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(musics[currentMusic % musics.length]
                            .cover!), //membantu memutar nama musik dari awal sampai akhir, mengambil data dari musics
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                musics[currentMusic % musics.length].namamusik!,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
              Text(
                musics[currentMusic % musics.length].penyanyi!,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              SizedBox(height: 20),
              StreamBuilder(
                  stream: player.onPositionChanged,
                  builder: (context, snapshot) {
                    return ProgressBar(
                      progress: snapshot.data ?? Duration(seconds: 0),
                      total: maxDuration,
                      onSeek: (duration) {
                        player.seek(duration);
                        setState(() {});
                      },
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        player.stop();
                        player.play(AssetSource(
                            musics[--currentMusic % musics.length].path!));
                        getMaxDuration();
                      },
                      icon: Icon(
                        Icons.skip_previous,
                        size: 32,
                        color: Colors.white,
                      )),
                  IconButton(
                    onPressed: () {
                      player.state == PlayerState.playing
                          ? player.pause()
                          : player.play(AssetSource(
                              musics[currentMusic % musics.length].path!));
                      getMaxDuration();
                      setState(() {});
                    },
                    icon: Icon(
                        player.state == PlayerState.playing
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 40,
                        color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        player.stop();
                        player.play(AssetSource(
                            musics[--currentMusic % musics.length].path!));
                        getMaxDuration();
                        setState(() {});
                      },
                      icon:
                          Icon(Icons.skip_next, size: 32, color: Colors.white)),
                ],
              )
            ],
          ),
        ),
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
