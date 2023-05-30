import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/database/functions/db_functions.dart';
import 'package:music_app/database/model/song_model.dart';
import 'package:music_app/screens/home_screens/bottom_nav_bar.dart';
import 'package:music_app/screens/widgets/main_play_screen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Song> songList = Hive.box<Song>(boxname).values.toList();

  late List<Song> songDisplay = List<Song>.from(songList);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNavBar()));
            },
          ),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                onChanged: (value) => updateList(value),
                controller: textController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          textController.clear();
                        }),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ValueListenableBuilder(
          valueListenable: songListNotifier,
          builder: (BuildContext ctx, List<Song> songList, Widget? child) {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = songDisplay[index];

                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/Song_logo.jpeg')),
                    ),
                    height: 50,
                    width: 50,
                  ),
                  onTap: () {
                    final updatedIndex = songList.indexWhere(
                        (element) => element.title == songDisplay[index].title);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NowPlaying(
                                index: updatedIndex,
                              )),
                    );
                  },
                  title: Text(
                    data.title!,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: songDisplay.length,
            );
          },
        ),
      ),
    );
  }

  updateList(String value) {
    setState(() {
      songDisplay = songList
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
