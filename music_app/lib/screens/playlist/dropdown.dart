import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuItem(
      child: TextButton.icon(
        onPressed: () {
          // Display the dropdown menu
          showMenu(
            context: context,
            position: RelativeRect.fill,
            items: [
              PopupMenuItem(
                child: Text('Playlist 1'),
                value: 'Playlist 1',
              ),
              PopupMenuItem(
                child: Text('Playlist 2'),
                value: 'Playlist 2',
              ),
              PopupMenuItem(
                child: Text('Playlist 3'),
                value: 'Playlist 3',
              ),
            ],
            elevation: 8.0,
          ).then((value) {
            // Handle the selected playlist
            if (value != null) {
              print('Selected playlist: $value');
              // Add the song to the selected playlist
            }
          });
        },
        icon: Icon(Icons.playlist_add_outlined),
        label: Text('Add to Existing Playlist'),
      ),
    );
  }
}
