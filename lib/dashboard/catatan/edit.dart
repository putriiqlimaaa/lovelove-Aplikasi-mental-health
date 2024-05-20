import 'package:flutter/material.dart';
import 'package:lovelove/dashboard/catatan/item.dart';

class editscreen extends StatefulWidget {
  final Note? note; //variabel yang akan menerima nilai, memberikan tanda tanya agar jika catatan dibuka tidak kehilangan tulisan sebelumnya
  const editscreen({super.key, this.note});

  @override
  State<editscreen> createState() => _editscreenState();
}

class _editscreenState extends State<editscreen> {

  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

  @override
  void initState() { //meneruskan sebagai nilai untuk teks, menambahkan tanda seru agar isinya tidak menghilang
    if(widget.note!=null){
      _title = TextEditingController(text: widget.note!.title);
    _content = TextEditingController(text: widget.note!.content);
    }
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Apresiasiku Hari Ini',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink[300],
          foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.pink[300],
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    controller: _title,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  TextField(
                    controller: _content,
                    style: TextStyle(color: Colors.white),
                    maxLines: null, //agar semua tulisan tidak terpotong
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Ketik apresiasimu...',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context, [
          _title.text, 
          _content.text
        ]);
      },
      elevation: 10,
      backgroundColor: Colors.grey.shade600,
      child: Icon(Icons.save),
      ),
    );
  }
}