class Note {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  Note({
    required this.id,
    required this.title, 
    required this.content, 
    required this.modifiedTime,
    
  });
}

  List<Note> sampleNotes = [
  Note(
    id: 0,
    title: 'Bahagia',
    content:
        'aku bahagia karena sudah bisa berkata tidak, dan lebih menyayangi diri sendiri',
    modifiedTime: DateTime(2022,1,1,34,5),
  ),
  Note(
    id: 1,
    title: 'Langit dipagi hari',
    content:
        'Aku sudah bisa mengatasi rasa malas setiap pagi',
    modifiedTime: DateTime(2022,1,1,34,5),
  ),
  Note(
    id: 2,
    title: 'Ujian itu juga berkah',
    content:
        'Aku sudah tak marah untuk semua hal yang sudah terjadi karena aku sadar jika Tuhan tidak akan menguji diluar batas kendali hambanya.',
    modifiedTime: DateTime(2023,3,1,19,5),
  ),
  ];