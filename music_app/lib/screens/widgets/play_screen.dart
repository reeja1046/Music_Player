// import 'package:flutter/material.dart';

// class SongList extends StatefulWidget {
//   final int index;
//   const SongList({super.key, required this.index});

//   @override
//   State<SongList> createState() => _SongListState();
// }

// class _SongListState extends State<SongList> {
//   @override
//   Widget build(BuildContext context) {
//     double progress = 0.0;
//     return Stack(
//       children: [
//         Container(
//           height: double.infinity,
//           width: double.infinity,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage('assets/images/perfect.jpeg'),
//             ),
//           ),
//           child: Scaffold(
//             backgroundColor: Colors.transparent,
//             body: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.black.withOpacity(0.1),
//                     Colors.black.withOpacity(0.2),
//                     Colors.black.withOpacity(0.3),
//                     Colors.black.withOpacity(0.5),
//                     Colors.black.withOpacity(0.7),
//                     Colors.black.withOpacity(0.9),
//                     Colors.black.withOpacity(1),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//               const Spacer(),
//               const Text(
//                 'Song Name',
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//               const Text(
//                 'Artist Name',
//                 style: TextStyle(color: Colors.white),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         // Navigator.of(context).push(MaterialPageRoute(
//                         //   builder: (context) => Playlist(),
//                         // ));
//                       },
//                       icon: const Icon(
//                         Icons.playlist_add,
//                         color: Colors.white,
//                         size: 35,
//                       )),
//                   IconButton(
//                     onPressed: () {
//                       // Navigator.of(context).push(MaterialPageRoute(
//                       //   builder: (context) => AddToFav(),
//                       // ));
//                     },
//                     icon: const Icon(Icons.favorite),
//                     color: Colors.white,
//                   )
//                 ],
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//               LinearProgressIndicator(
//                 value: progress / 100,
//                 minHeight: 3.0,
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text('00:00'),
//                   Text('04:03'),
//                 ],
//               ),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//               Container(
//                 padding: const EdgeInsets.all(5),
//                 color: Colors.grey.withOpacity(0.5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.shuffle,
//                         size: 30,
//                       ),
//                       color: Colors.white,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.replay_10,
//                         size: 30,
//                       ),
//                       color: Colors.white,
//                     ),
//                     IconButton(
//                       iconSize: 50,
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.play_circle_fill,
//                         size: 50,
//                       ),
//                       color: Colors.white,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.forward_10,
//                         size: 30,
//                       ),
//                       color: Colors.white,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.repeat,
//                         size: 30,
//                       ),
//                       color: Colors.white,
//                     ),

                  
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }


// }
