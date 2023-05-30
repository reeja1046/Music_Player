import 'package:flutter/material.dart';

class CreatePlaylist extends StatelessWidget {
  const CreatePlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Playlist'),
      content: TextFormField(),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, 'Create'),
          child: const Text('Create'),
        ),
      ],
    );
  }
}
