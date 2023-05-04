import 'package:flutter/material.dart';
import 'package:music_app/screens/home_screens/favourites.dart';
import 'package:music_app/screens/widgets/play_screen.dart';
import 'package:music_app/screens/playlist/create_playlist.dart';
import 'package:music_app/screens/playlist/dropdown.dart';

class RecentlyPlayed extends StatefulWidget {
  const RecentlyPlayed({super.key});

  @override
  State<RecentlyPlayed> createState() => _RecentlyPlayedState();
}

class _RecentlyPlayedState extends State<RecentlyPlayed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            ' Recently Played',
            style: TextStyle(color: Colors.teal, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
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
                                    child: const Text('Create New Playlist')),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child:
                                        const Text('Add to existing Playlist')),
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
                    builder: (context) => const NowPlaying()));
              },
            );
          },
        ),
      ),
    );
  }
}
