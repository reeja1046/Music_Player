
import 'package:flutter/material.dart';
import 'package:music_app/database/model/song_model.dart';
import 'package:music_app/screens/widgets/appbar_widget.dart';

class Recentlyplayedscreen extends StatefulWidget {
  const Recentlyplayedscreen({super.key});

  @override
  State<Recentlyplayedscreen> createState() => _RecentlyplayedscreenState();
}

class _RecentlyplayedscreenState extends State<Recentlyplayedscreen> {
  List<RecentlyPlayed> RecentlyPlayedList = [];
  final box = RecentlyPlayedBox.getinstance();

  @override
  void initState() {
    RecentlyPlayedList = box.values.toList().reversed.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children:const [
           ScreenAppbarWidget(title: 'Recently Played'),
          
        ]),
      ),
    );
  }
}


