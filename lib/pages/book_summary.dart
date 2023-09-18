import 'package:ashresume/pages/quizz_page.dart';
import 'package:ashresume/pages/reading_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share/share.dart';

import 'globals.dart';
import 'home.dart';

class DetailsPage extends StatefulWidget {
  final CardItem item;

  const DetailsPage({required this.item});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isBookmarked = false;
  int time = 0;
  double iconScale = 1.0;
  String? selectedAge;
  String? selectedTime;
  String? selectedLanguage;

  List<String> ageOptions = ['09 years', '15 years', '20 years'];
  List<String> timeOptions = ['03 min', '05 min', '15 min', '01 hr'];
  List<String> languageOptions = ['French', 'English', 'Spanish'];

  Future<void> shareApp() async {
    final String appLink =
        'https://play.google.com/store/apps/details?id=com.example.myapp';
    final String message = 'Check out my new app: $appLink';
    await Share.share('Share App: $message');
  }

  Future<void> navigateToKeyPointScreen(int index) async {
    int totalTimeSpent = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KeyPointScreen(
          keyPoints: widget.item.keyPoints,
          index: index,
        ),
      ),
    );
    setState(() {
      time += totalTimeSpent;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You read for: $time'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> keyTiles = [];
    int index = 1;

    for (int i = 0; i < widget.item.keyPoints.length; i++) {
      Map<String, dynamic> keyPoint = widget.item.keyPoints[i];
      String name = keyPoint['name'];

      keyTiles.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              ListTile(
                title: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '$index',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: ' $name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  navigateToKeyPointScreen(i);
                },
              ),
              Divider(height: 1),
            ],
          ),
        ),
      );
      index++;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Image.asset(widget.item.imagePath),
                ),
                Positioned(
                  top: -15,
                  right: -10,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            iconScale += 0.2;
                          });
                          // Handle download logic here
                        },
                        child: Transform.scale(
                          scale: iconScale,
                          child: IconButton(
                            icon: Icon(
                              Icons.download,
                            ),
                            onPressed: () {
                              // Handle download logic here
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            iconScale += 0.2;
                          });
                          // Handle sharing logic here
                        },
                        child: Transform.scale(
                          scale: iconScale,
                          child: IconButton(
                            icon: Icon(
                              Icons.share,
                            ),
                            onPressed: () {
                              shareApp();
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Transform.scale(
                          scale: iconScale,
                          child: IconButton(
                            icon: isBookmarked
                                ? Icon(Icons.bookmark)
                                : Icon(Icons.bookmark_border),
                            onPressed: () {
                              setState(() {
                                isBookmarked = !isBookmarked;
                              });
                              if (isBookmarked) {
                                addedToLib.add(widget.item);
                              } else {
                                addedToLib.remove(widget.item);
                              }
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: IconButton(
                          icon: Icon(
                            Icons.question_mark,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    QuizScreen(summaryId: widget.item.id),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton<String>(
                      value: selectedAge,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedAge = newValue;
                        });
                        // Handle age selection logic here
                      },
                      items: ageOptions.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      hint: Text('Select Age'),
                    ),
                    DropdownButton<String>(
                      value: selectedTime,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedTime = newValue;
                        });
                        // Handle time selection logic here
                      },
                      items: timeOptions.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      hint: Text('Select Time'),
                    ),
                    DropdownButton<String>(
                      value: selectedLanguage,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLanguage = newValue;
                        });
                        // Handle language selection logic here
                      },
                      items: languageOptions.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      hint: Text('Select Language'),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Summary",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "authorName",
                    // widget.item.original_content.val('author') as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(width: 16),
                Icon(Icons.list),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'keypoints: ${widget.item.keyPoints.length}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 18),
                Icon(Icons.access_time),
                Text(
                  'Time: ${widget.item.reading_time}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: keyTiles,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle read logic here
                  },
                  icon: Icon(Icons.book),
                  label: Text('Read'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle listen logic here
                  },
                  icon: Icon(Icons.headphones),
                  label: Text('Listen'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
