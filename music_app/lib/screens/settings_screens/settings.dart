import 'package:flutter/material.dart';
import 'package:music_app/screens/settings_screens/about_us.dart';
import 'package:music_app/screens/settings_screens/privacy_policy.dart';
import 'package:music_app/screens/settings_screens/support.dart';
import 'package:music_app/screens/settings_screens/terms_conditions.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({super.key});

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.teal, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            ListTile(
              title: const Text(
                ' Terms & Conditions ',
                style: TextStyle(color: Colors.teal, fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.teal,
                size: 18,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TermsAndConditions()));
              },
            ),
            // ListTile(
            //   title: const Text(
            //     ' Settings ',
            //     style: TextStyle(color: Colors.teal, fontSize: 18),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_rounded,
            //     color: Colors.teal,
            //     size: 18,
            //   ),
            //   onTap: () {},
            // ),
            ListTile(
              title: const Text(
                ' About Us ',
                style: TextStyle(color: Colors.teal, fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.teal,
                size: 18,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            ListTile(
              title: const Text(
                ' Privacy Policy ',
                style: TextStyle(color: Colors.teal, fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.teal,
                size: 18,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              },
            ),
            ListTile(
              title: const Text(
                ' Support ',
                style: TextStyle(color: Colors.teal, fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.teal,
                size: 18,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Support()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
