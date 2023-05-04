import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal.shade800,
                Colors.teal.shade700,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: TextField(
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.black38),
            border: InputBorder.none,
          ),
          onChanged: (value) {},
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.teal.shade800,
          Colors.grey.shade900,
        ])),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
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
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              subtitle: const Text('Sithara',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            );
          },
        ),
      ),
    );
  }
}
