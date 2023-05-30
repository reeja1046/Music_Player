import 'package:flutter/material.dart';
import 'package:music_app/screens/home_screens/library/favourites.dart';
import 'package:music_app/screens/widgets/appbar_widget.dart';
import 'package:music_app/screens/widgets/main_play_screen.dart';

import '../../playlist/create_playlist.dart';

class MostlyPlayed extends StatefulWidget {
  const MostlyPlayed({super.key});

  @override
  State<MostlyPlayed> createState() => _MostlyPlayedState();
}

class _MostlyPlayedState extends State<MostlyPlayed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ScreenAppbarWidget(title: 'Mostly Played'),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/pic.jpeg'),
                        ),
                      ),
                    ),
                    trailing: PopupMenuButton(
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddToFav()));
                            },
                            icon: const Icon(Icons.favorite),
                            label: const Text('Add to Favourites'),
                          ),
                        ),
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => const Playlist()));
                              showBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: 100,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const CreatePlaylist()));
                                              },
                                              child: const Text(
                                                  'Create New Playlist')),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                  'Add to existing Playlist')),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.playlist_add_outlined),
                            label: const Text('Add to Playlist'),
                          ),
                        ),
                      ],
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.teal,
                      ),
                    ),
                    title: const Text(
                      'Kangal Neeye',
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                    subtitle: const Text('Sithara',
                        style: TextStyle(fontSize: 14, color: Colors.teal)),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NowPlaying(
                                index: 0,
                              )));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
