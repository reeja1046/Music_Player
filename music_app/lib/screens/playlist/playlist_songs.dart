import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:music_app/database/functions/db_func.dart';
import 'package:music_app/database/functions/db_functions.dart';
import 'package:music_app/database/model/song_model.dart';
import 'package:music_app/screens/widgets/main_play_screen.dart';
import 'package:music_app/screens/widgets/search_screen.dart';
import 'package:on_audio_query/on_audio_query.dart';

class EachPlaylistSongs extends StatefulWidget {
  PlayLists playlist;
  EachPlaylistSongs({super.key, required this.playlist});

  @override
  State<EachPlaylistSongs> createState() => _EachPlaylistSongsState();
}

class _EachPlaylistSongsState extends State<EachPlaylistSongs> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId("0");
  final box = SongBox.getinstance();
  late List<Song> allDbSongs;
  List<Audio> convertPAudios = [];
  List<Song> playlistSongs = [];
  List<PlayLists> allDbPlaylists = playlistdb.values.toList();
  @override
  void initState() {
    allDbSongs = box.values.toList();
    playlistSongs = widget.playlist.playlistsongs!.toList();
    for (var element in playlistSongs) {
      convertPAudios.add(Audio.file(element.songurl!,
          metas: Metas(
              artist: element.artist,
              title: element.title,
              id: element.id.toString())));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height1 = MediaQuery.of(context).size.height;
    final width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      body: (playlistSongs.isEmpty)
          ? Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: height1 * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Empty !!! ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.9),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height1 * 0.06,
                          right: width1 * 0.02,
                          left: width1 * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    size: 25,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: width1 * 0.04,
                              ),
                              Text(
                                '${widget.playlist.playlistname![0].toUpperCase()}${widget.playlist.playlistname!.substring(1)} Playlist',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreen(
                                      songList: playlistSongs,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.search_sharp,
                                size: 25,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: height1 * 0.35,
                        width: width1,
                        foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.9),
                            ])),
                        child: QueryArtworkWidget(
                          artworkFit: BoxFit.fill,
                          id: playlistSongs.first.id!,
                          type: ArtworkType.AUDIO,
                          artworkQuality: FilterQuality.high,
                          size: 2000,
                          quality: 100,
                          artworkBorder: BorderRadius.circular(10),
                          nullArtworkWidget: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/All_songs_logo.jpeg')),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: height1 * 0.24,
                        left: width1 * 0.39,
                        child: Column(
                          children: [
                            Text(
                              (widget.playlist.playlistsongs!.length <= 1)
                                  ? '${widget.playlist.playlistsongs!.length.toString()} Song'
                                  : '${widget.playlist.playlistsongs!.length.toString()} Songs',
                              style: const TextStyle(
                                  fontSize: 23, color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: playlistSongs.length + 1,
                    itemBuilder: (context, index) {
                      return (index == playlistSongs.length)
                          ? SizedBox(
                              height: height1 * 0.08,
                            )
                          : ListTile(
                              onTap: () {
                                RecentlyPlayed recentlySong;
                                MostlyPlayed mostlySong;
                                Song currentSong = playlistSongs[index];
                                recentlySong = RecentlyPlayed(
                                    title: currentSong.title,
                                    artist: currentSong.artist,
                                    duration: currentSong.duration,
                                    songurl: currentSong.songurl,
                                    id: currentSong.id);
                                mostlySong = MostlyPlayed(
                                    title: currentSong.title!,
                                    songurl: currentSong.songurl,
                                    duration: currentSong.duration,
                                    artist: currentSong.artist,
                                    count: 1,
                                    id: currentSong.id);
                                addRecently(recentlySong);
                                addMostly(mostlySong);
                                audioPlayer.open(
                                    Playlist(
                                        audios: convertPAudios,
                                        startIndex: index),
                                    showNotification: true,
                                    headPhoneStrategy: HeadPhoneStrategy
                                        .pauseOnUnplugPlayOnPlug,
                                    loopMode: LoopMode.playlist);
                                setState(() {});
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NowPlaying(
                                          index: index,
                                          nowPlayList: playlistSongs,
                                        )));
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              leading: QueryArtworkWidget(
                                artworkFit: BoxFit.cover,
                                id: playlistSongs[index].id!,
                                type: ArtworkType.AUDIO,
                                artworkQuality: FilterQuality.high,
                                size: 3000,
                                quality: 100,
                                artworkBorder: BorderRadius.circular(10),
                                nullArtworkWidget: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/All_songs_logo.jpeg')),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                              ),
                              title: Marquee(
                                animationDuration:
                                    const Duration(milliseconds: 6500),
                                directionMarguee: DirectionMarguee.oneDirection,
                                pauseDuration:
                                    const Duration(milliseconds: 1000),
                                child: Text(
                                  playlistSongs[index].title!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                              subtitle:
                                  playlistSongs[index].artist == '<unknown>'
                                      ? const Text(
                                          'Unknown Artist',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        )
                                      : Text(
                                          playlistSongs[index].artist!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        ),
                              trailing: PopupMenuButton<String>(
                                color: Colors.white,
                                padding: const EdgeInsets.all(1.0),
                                onSelected: (String value) {},
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    value: "Remove",
                                    child: TextButton(
                                        onPressed: () {
                                          int currentIndex = allDbPlaylists
                                              .indexWhere((element) =>
                                                  element.playlistname ==
                                                  widget.playlist.playlistname);
                                          Navigator.pop(context);
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext ctx) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Remove from ${widget.playlist.playlistname} Playlist'),
                                                  content: const Text(
                                                      'Are You Sure?'),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            'Cancel')),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          convertPAudios
                                                              .removeAt(index);
                                                          playlistSongs
                                                              .removeAt(index);
                                                          widget.playlist
                                                              .playlistsongs!
                                                              .removeAt(index);
                                                          PlayLists
                                                              updatedPlaylist =
                                                              PlayLists(
                                                                  playlistname: widget
                                                                      .playlist
                                                                      .playlistname,
                                                                  playlistsongs:
                                                                      playlistSongs);
                                                          playlistdb.put(
                                                              currentIndex,
                                                              updatedPlaylist);
                                                          setState(() {});
                                                          Navigator.of(ctx)
                                                              .pop();
                                                          ScaffoldMessenger.of(
                                                                  ctx)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                  'Removed from ${widget.playlist.playlistname} Playlist'),
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          600),
                                                            ),
                                                          );
                                                        },
                                                        child: const Text(
                                                            'Remove'))
                                                  ],
                                                );
                                              });
                                        },
                                        child: Text(
                                            'Remove from ${widget.playlist.playlistname}',
                                            style:
                                                const TextStyle(fontSize: 14))),
                                  ),
                                  // PopupMenuItem<String>(
                                  //   value: "Playlists",
                                  //   child: AddToPlaylists(
                                  //       songIndex: allDbSongs.indexWhere(
                                  //           (element) =>
                                  //               element.id ==
                                  //               playlistSongs[index].id)),
                                  // ),
                                ],
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
