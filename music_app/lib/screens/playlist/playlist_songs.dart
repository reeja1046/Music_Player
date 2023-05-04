import 'package:flutter/material.dart';

class PlaylistSongs extends StatefulWidget {
  const PlaylistSongs({super.key});

  @override
  State<PlaylistSongs> createState() => _PlaylistSongsState();
}

class _PlaylistSongsState extends State<PlaylistSongs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Mind Relaxing ',
          style: TextStyle(color: Colors.teal, fontSize: 23),
        ),
      ),
      body: Padding(
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
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/Kangal.jpeg'),
                      ),
                    ),
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                          label: const Text('Remove from playlist'),
                        ),
                      ),
                    ],
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.teal,
                    ),
                  ),
                  title: const Text(
                    'Kangal neeye',
                    style: TextStyle(fontSize: 18, color: Colors.teal),
                  ),
                );
              },
            ),
          ],
        )),
      ),
    );
  }
}
