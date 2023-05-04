import 'package:flutter/material.dart';

import '../playlist/playlist.dart';

class AddToFav extends StatefulWidget {
  const AddToFav({super.key});

  @override
  State<AddToFav> createState() => _AddToFavState();
}

class _AddToFavState extends State<AddToFav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Favourites ',
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
              trailing: IconButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Remove from Favorites'),
                      content: const Text('Are You Sure?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.teal,
                ),
              ),
              leading: Container(
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/Kangal.jpeg'),
                  ),
                ),
              ),
              title: const Text(
                'Kangal Neeye',
                style: TextStyle(fontSize: 16, color: Colors.teal),
              ),
              subtitle: const Text('Sithara',
                  style: TextStyle(fontSize: 14, color: Colors.teal)),
            );
          },
        ),
      ),
    );
  }
}
