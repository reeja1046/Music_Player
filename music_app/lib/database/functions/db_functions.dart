import 'package:flutter/material.dart';
import 'package:music_app/database/functions/db_func.dart';
import 'package:music_app/database/model/song_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

ValueNotifier<List<Song>> songListNotifier = ValueNotifier([]);

final audioQuery = OnAudioQuery();
final box = SongBox.getinstance();
List<SongModel> fetchSongs = [];
List<SongModel> allSongs = [];

Future<void> requestPermission() async {
  bool permissionstatus = await audioQuery.permissionsStatus();
  if (!permissionstatus) {
    await audioQuery.permissionsRequest();

    fetchSongs = await audioQuery.querySongs();
    for (var element in fetchSongs) {
      if (element.fileExtension == 'mp3') {
        allSongs.add(element);
      }
    }

    for (var element in allSongs) {
      await box.add(Song(
          title: element.title,
          artist: element.artist,
          duration: element.duration,
          songurl: element.uri,
          id: element.id));
    }
  }
}

addRecently(RecentlyPlayed song) {
  List recentList = recentplayeddb.values.toList();
  
}
