import 'package:flutter/material.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  bool isPlaying = false;
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Now Playing',
            style: TextStyle(color: Colors.teal, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 120,
                      backgroundImage: AssetImage(
                        'assets/images/Kangal.jpeg',
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const Text(
                      'Song Name',
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    const Text(
                      'Artist Name',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ]),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => Playlist(),
                      // ));
                    },
                    icon:const Icon(
                      Icons.playlist_add,
                      color: Colors.teal,
                      size: 35,
                    )),
                IconButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => AddToFav(),
                    // ));
                  },
                  icon: const Icon(Icons.favorite),
                  color: Colors.teal,
                )
              ],
            ),
          const  Padding(padding: EdgeInsets.only(top: 25)),
            LinearProgressIndicator(
              value: progress / 100,
              minHeight: 3.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon:const Icon(
                      Icons.skip_previous,
                      color: Colors.teal,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                      size: 50,
                    ),
                    color: Colors.teal,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.teal,
                        size: 50,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shuffle),
                    color: Colors.teal,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.repeat),
                    color: Colors.teal,
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
