import 'package:flutter/material.dart';
import 'package:we_music/models/Item_model.dart';
import 'package:just_audio/just_audio.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();

  int? _playingIndex;

  List<Item> items = [
    Item(
        name: "Aapna Time Aayega",
        audioPath: "music_audios/aapna_time_aayega.mp3",
        imagePath: "music_backgrounds/apna_time_aayega.jpg"),
    Item(
        name: "Chal Bombay",
        audioPath: "music_audios/chal_bombay.mp3",
        imagePath: "music_backgrounds/chal_bombay.jpg"),
    Item(
        name: "Mantoniyat",
        audioPath: "music_audios/manto.mp3",
        imagePath: "music_backgrounds/manto.jpg"),
    Item(
        name: "Nachne Ka Shanq",
        audioPath: "music_audios/nachne_ka_shanq.mp3",
        imagePath: "music_backgrounds/nachne_ka_shanq.jpg"),
    Item(
        name: "Satya",
        audioPath: "music_audios/satya.mp3",
        imagePath: "music_backgrounds/satya.jpg"),
    Item(
        name: "Goat Dekho",
        audioPath: "music_audios/goat_dekho.mp3",
        imagePath: "music_backgrounds/goat_dekho.jpg"),
    Item(
      name: "Gangster",
      audioPath: "music_audios/gangster.mp3",
      imagePath: "music_backgrounds/gangster.jpg",
    ),
    Item(
        name: "Teesri Manzil",
        audioPath: "music_audios/teesri_manzil.mp3",
        imagePath: "music_backgrounds/teesri_manzil.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "We Music",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(items[index].imagePath),
                      )),
                  child: ListTile(
                    leading: Text(
                      items[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    trailing: IconButton(
                      icon: _playingIndex == index
                          ? const Icon(
                              Icons.stop,
                              size: 30,
                            )
                          : const Icon(
                              Icons.play_arrow,
                              size: 30,
                            ),
                      onPressed: () {
                        if (_playingIndex == index) {
                          setState(() {
                            _playingIndex = null;
                          });
                          audioPlayer.stop();
                        } else {
                          audioPlayer.setAsset(items[index].audioPath);
                          audioPlayer.play();
                          setState(() {
                            _playingIndex = index;
                          });
                        }
                      },
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
