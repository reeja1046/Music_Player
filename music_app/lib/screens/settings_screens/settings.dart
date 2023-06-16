import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/screens/settings_screens/privacy_policy.dart';

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
        backgroundColor: const Color.fromARGB(255, 1, 30, 56),
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            ListTile(
              title: const Text(
                ' About Us ',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                ' Privacy Policy ',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 18,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PrivacyPolicy()));
              },
            ),
            // ListTile(
            //   title: const Text(
            //     ' Terms & Conditions ',
            //     style: TextStyle(color: Colors.white, fontSize: 18),
            //   ),
            //   trailing: const Icon(
            //     Icons.arrow_forward_ios_rounded,
            //     color: Colors.white,
            //     size: 18,
            //   ),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const TermsAndConditions()));
            //   },
            // ),
            ListTile(
              title: const Text(
                ' Share ',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 18,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                ' Exit ',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 25,
              ),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
