import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_app/database/model/song_model.dart';
import 'package:music_app/screens/home_screens/library/favourites.dart';
import 'package:music_app/screens/home_screens/library/library_buttons.dart';
import 'package:music_app/screens/home_screens/library/mostly_played.dart';
import 'package:music_app/screens/home_screens/my_songs.dart';
import 'package:music_app/screens/home_screens/library/recently_played.dart';
// import 'package:music_app/screens/home_screens/library/buttons.dart';
// import 'package:music_app/screens/library/buttons.dart';
// import 'package:music_app/screens/library/mostly_played.dart';

List<Audio> audioList = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final box = SongBox.getinstance();
late List<Song> allSongs;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    allSongs = box.values.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 30, 56),
          centerTitle: true,
          title: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color.fromARGB(255, 119, 193, 253),
                Color.fromARGB(255, 0, 83, 125)
              ],
            ).createShader(bounds),
            child: const Text(
              'SERAPHINE',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              subtitle(name: 'Library'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                LibraryButtons(
                    title: 'Recently Played',
                    onPressed: const Recentlyplayedscreen()),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                LibraryButtons(
                    title: 'Mostly Played', onPressed: const MostlyPlayed()),
              ]),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              LibraryButtons(title: 'Favorites', onPressed: const AddToFav()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              subtitle(name: 'Your Collections'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => MySongs(
                        index: index,
                        song: allSongs[index],
                        songlist: [],
                      ),
                  itemCount: allSongs.length),
            ]),
          ),
        ),
      ),
    );
  }

  subtitle({required name}) {
    return Text(
      '$name',
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
