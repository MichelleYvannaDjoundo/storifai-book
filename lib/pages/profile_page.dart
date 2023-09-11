import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

import 'Auth/login_page.dart';

class ProfileScreen1 extends StatefulWidget {
  const ProfileScreen1({Key? key}) : super(key: key);

  @override
  State<ProfileScreen1> createState() => _ProfileScreen1State();
}

class _ProfileScreen1State extends State<ProfileScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(children: [
                CircleAvatar(
                  radius: 60,
                  //backgroundImage: AssetImage('images/boy_water.jpeg'),
                ),
                const SizedBox(width: 16),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 16),          
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Please login")
            ),
          ],
        ),
      ),
    );
  }
}
