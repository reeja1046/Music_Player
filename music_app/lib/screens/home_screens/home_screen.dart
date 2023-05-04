import 'package:flutter/material.dart';
import 'package:music_app/screens/home_screens/favourites.dart';
import 'package:music_app/screens/home_screens/library_buttons.dart';
import 'package:music_app/screens/home_screens/mostly_played.dart';
import 'package:music_app/screens/home_screens/my_songs.dart';
import 'package:music_app/screens/home_screens/recently_played.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Welcome to Seraphine',
          style: TextStyle(color: Colors.teal, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                subtitle(name: 'Library'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          MainButton(
                              title: 'Recently played',
                              onPressed: const RecentlyPlayed()),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03),
                          MainButton(
                              title: 'Mostly Played',
                              onPressed: const MostlyPlayed()),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03),
                          MainButton(
                              title: 'Favorites', onPressed: const AddToFav())
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                subtitle(name: 'Your Collections'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const MySongs(),
              ],
            ),
          ),
        )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  subtitle({required name}) {
    return Text(
      '$name',
      style: const TextStyle(color: Colors.teal, fontSize: 20),
    );
  }
}
