
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/database/model/song_model.dart';

late Box<FavSongs> favsongsdb;
openFavDb() async {
  favsongsdb = await Hive.openBox<FavSongs>('favorites');
}

late Box<RecentlyPlayed> recentplayeddb;
openrecentplayedDB() async {
  recentplayeddb = await Hive.openBox<RecentlyPlayed>('RecentlyPlayed');
}