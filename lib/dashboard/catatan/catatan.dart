import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lovelove/dashboard/akun/menu/aboutus.dart';
import 'package:lovelove/dashboard/akun/menu/privacy.dart';
import 'package:lovelove/dashboard/akun/menu/profile.dart';
import 'package:lovelove/dashboard/catatan/edit.dart';
import 'package:lovelove/dashboard/catatan/item.dart';
import 'package:lovelove/login.dart';
import 'package:lovelove/theme.dart';

class catatan extends StatefulWidget {
  const catatan({super.key});

  @override
  State<catatan> createState() => _catatanState();
}

class _catatanState extends State<catatan> {

  //membuat daftar kosong list pencarian
  List<Note> filteredNotes = [];
  bool sorted = false; //variabel keadaan diurutkan dan dianalisis ke false

  //membuat filter berisi daftar sample yang telah dibuat
  @override
  void initState() {
    super.initState();
    filteredNotes = sampleNotes;
  }

  //fungsi untuk penyortian berdasarkan terakhir di edit
  List<Note> sortbyModifiedTime(List<Note> notes) {
    //untuk icon atas
    if (sorted) {
      notes.sort((a, b) => a.modifiedTime.compareTo(b.modifiedTime)); //daftar dalam urutan menaik berdasarkan waktu modifikasinya
    } else {
      notes.sort((b, a) => a.modifiedTime.compareTo(b.modifiedTime)); //menurun
    }
    sorted = !sorted; //mengurutkan daftar

    return notes;
  }

  //mencari catatan dari search
  void onSearchTextChanged(String searchText) {
    setState(() {
      filteredNotes = sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  //menghapus catatan
  void delete(int index) {
    setState(() {
      filteredNotes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 0), //ganda kiri, ganda atas, ganda kanan, ganda bawah
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Apresiasiku",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        filteredNotes = sortbyModifiedTime(filteredNotes); //menyortit/mengurutkan catatan berdasarkan waktu
                      });
                    },
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: pinkMuda.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: onSearchTextChanged, //mencari catatan agar berubah
              style: TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade200),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade200,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey.shade200)),
                  //mengaktifkan batas pada saat textfield tidak aktif
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey.shade200))),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 30),
                itemCount: filteredNotes.length, //memfilter catatan yang dicari
                itemBuilder: (context, index) {
                  return Card( //untuk membuat area persegi panjang dengan 4 sudut membulat dan efek bayangan ditepinya
                      margin: EdgeInsets.only(bottom: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          onTap: () async { //membuat catatan bisa diedit kembali
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        editscreen(
                                          note: filteredNotes[index],
                                        )));
                            if (result != null) {
                              setState(() {
                                int originalIndex =
                                    sampleNotes.indexOf(filteredNotes[index]); //menambahkan indeks dari yang dipilih
                                sampleNotes[originalIndex] = Note( //untuk membuat catatan baru yang telah diedit
                                    id: sampleNotes[originalIndex].id,
                                    title: result[0],
                                    content: result[1],
                                    modifiedTime: DateTime.now());
                                filteredNotes[index] = Note(
                                    id: sampleNotes[originalIndex].id,
                                    title: result[0],
                                    content: result[1],
                                    modifiedTime: DateTime.now());
                              });
                            }
                          },
                          title: RichText( //jika kata pada teks terlalu panjang, maka teks akan dimuat dibaris berikutnya
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan( //rentang teks yang tidak dapat diubah
                                text: "${filteredNotes[index].title} \n", //index untuk nilai dalamnya
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  height: 1.5,
                                ),
                                children: [
                                  TextSpan(
                                      text: "${filteredNotes[index].content}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                          height: 1.5))
                                ]),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Edited: ${DateFormat('EEE, d MMM yyy h:mm a').format(filteredNotes[index].modifiedTime)}",
                              style: TextStyle(
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                delete(index);
                              },
                              icon: Icon(Icons.delete)),
                        ),
                      ));
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push( //mengembalikan data dari layar edit
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => editscreen()));

          if (result != null) { //mengecek apakah hasilnya berbeda dari sekarang
            setState(() {
              sampleNotes.add(Note( //menambah catatan baru
                  id: sampleNotes.length,
                  title: result[0],
                  content: result[1],
                  modifiedTime: DateTime.now()));
              filteredNotes = sampleNotes;
            });
          }
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade600,
        child: Icon(
          Icons.add,
          size: 38,
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
