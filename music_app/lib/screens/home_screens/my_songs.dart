import 'package:flutter/material.dart';
import 'package:music_app/database/functions/fav_db_functions.dart';
import 'package:music_app/database/model/song_model.dart';
import 'package:music_app/screens/playlist/create_playlist.dart';
import 'package:music_app/screens/widgets/main_play_screen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MySongs extends StatefulWidget {
  final Song song;
  List<Song> songlist;
  final int index;
  MySongs(
      {super.key,
      required this.index,
      required this.song,
      required this.songlist});

  @override
  State<MySongs> createState() => _MySongsState();
}

bool istapped = false;
final box = SongBox.getinstance();
late List<Song> allSongs;
List<Audio> convertAudios = [];
AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

class _MySongsState extends State<MySongs> {
  @override
  void initState() {
    allSongs = box.values.toList();
    for (var element in allSongs) {
      convertAudios.add(
        Audio.file(
          element.songurl!,
          metas: Metas(
            title: element.title,
            artist: element.artist,
            id: element.id.toString(),
          ),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        audioPlayer.open(
          Playlist(
            audios: convertAudios,
            startIndex: widget.index,
          ),
          headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplugPlayOnPlug,
          showNotification: true,
          loopMode: LoopMode.playlist,
        );
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NowPlaying(index: widget.index)));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      leading: QueryArtworkWidget(
        id: allSongs[widget.index].id!,
        type: ArtworkType.AUDIO,
        size: 3000,
        artworkFit: BoxFit.cover,
        artworkBorder: BorderRadius.circular(10),
        artworkQuality: FilterQuality.high,
        nullArtworkWidget: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
                image: AssetImage('assets/images/All_songs_logo.jpeg')),
          ),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.height * 0.07,
        ),
      ),
      title: Text(
        allSongs[widget.index].title!,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      subtitle: Text(allSongs[widget.index].artist.toString(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontSize: 14, color: Colors.white)),
      trailing: PopupMenuButton(
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          PopupMenuItem(
              child: TextButton(
            onPressed: () {
              addToFavorite(widget.song.id, context);
              Navigator.of(context).pop();
            },
            child: Text(isalready(widget.song.id)
                ? 'Remove from favourites'
                : 'Add to favourites'),
          )),
          PopupMenuItem(
            child: TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
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
                                  Navigator.of(context).push(MaterialPageRoute(
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
                                child: const Text('Add to existing Playlist')),
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
          color: Colors.white,
        ),
      ),
    );
  }
}
