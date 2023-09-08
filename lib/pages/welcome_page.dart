import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Welcome to BookApp',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       GridView.count(
            //         shrinkWrap: true,
            //         crossAxisCount: 2, // Number of columns
            //         children: List.generate(6, (index) {
            //           return Container(
            //             margin: EdgeInsets.all(4.0),
            //             child: Image.asset(
            //               'lib/images/Becoming.png',
            //               width: 1000,
            //               height: 100,
            //             ),
            //           );
            //         }),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/information');
                    },
                    child: Text('Get Started'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
