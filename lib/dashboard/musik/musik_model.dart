class musikmodel {
  final String? namamusik;
  final String? penyanyi;
  final String? cover;
  final String? path;

  musikmodel(
      {required this.namamusik,
      required this.penyanyi,
      required this.cover,
      required this.path});
}

List<musikmodel> musics = [
  musikmodel(
      penyanyi: "Blackpink",
      cover:
          "https://i.pinimg.com/736x/6d/c7/4b/6dc74b7c866d30893bf270e2d66a50e1.jpg",
      path: 'mp3/boombayah.mp3',
      namamusik: "Boombayah"),
  musikmodel(
      penyanyi: "Jennie Blackpink",
      cover:
          "https://celebmafia.com/wp-content/uploads/2018/11/jennie-solo-photos-2018-2.jpg",
      path: 'mp3/jennie_solo.mp3',
      namamusik: "Solo"),
  musikmodel(
      penyanyi: "Hindia",
      cover:
          "https://cdn.idntimes.com/content-images/community/2020/05/66089935-446928936162291-2027633539223442417-n-e9f8080792408b82a93aa21407a35481.jpg",
      path: 'mp3/Hindia_Evakuasi.mp3',
      namamusik: "Evakuasi"),
  musikmodel(
      penyanyi: "Selena Gomez",
      cover:
          "https://celebmafia.com/wp-content/uploads/2017/03/selena-gomez-social-media-3-21-2017-1.jpg",
      path: 'mp3/selena.mp3',
      namamusik: "Who Says"),
  musikmodel(
      penyanyi: "Idgitaf",
      cover:
          "https://cloud.jpnn.com/photo/arsip/normal/2023/07/27/penyanyi-idgitaf-alias-gita-foto-dok-idgitaf-musik-qhlzi-bhle.jpg",
      path: 'mp3/satusatu.mp3',
      namamusik: "Satu Satu"),
  musikmodel(
      penyanyi: "Yotari",
      cover:
          "https://img.okezone.com/content/2021/06/19/205/2427697/usia-ikut-indonesian-idol-yotari-hadirkan-album-perdana-4OGmgsmOOC.jpg",
      path: 'mp3/carabahagia.mp3',
      namamusik: "Cara Bahagia"),
  musikmodel(
      penyanyi: "Yura Yunita",
      cover: "https://gigsplay.com/wp-content/uploads/2020/08/yura_yunita.jpg",
      path: 'mp3/tuturbatin.mp3',
      namamusik: "Tutur Batin")
];
