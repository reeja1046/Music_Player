import 'package:flutter/material.dart';
import 'package:music_app/screens/playlist/playlist_songs.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Playlist ',
          style: TextStyle(color: Colors.teal, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SafeArea(
              child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 50,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/perfect.jpeg'),
                        ),
                      ),
                    ),
                    trailing: PopupMenuButton(
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                            label: const Text('Edit Playlist'),
                          ),
                        ),
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                            label: const Text('Delete Playlist'),
                          ),
                        ),
                      ],
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.teal,
                      ),
                    ),
                    title: const Text(
                      'Mind relaxing',
                      style: TextStyle(fontSize: 18, color: Colors.teal),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PlaylistSongs()));
                    },
                  );
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}
