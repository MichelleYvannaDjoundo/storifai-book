import 'dart:convert';

import 'package:ashresume/pages/book_summary.dart';
import 'package:ashresume/pages/globals.dart';
import 'package:ashresume/pages/library_page.dart';
import 'package:ashresume/pages/new_story.dart';
import 'package:ashresume/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;

import '../Services/http.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    NewStoryScreen(),
    LibraryScreen(
      addedToLib: addedToLib,
    ),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: GNav(
        gap: 0.1,
        backgroundColor: Color.fromARGB(255, 68, 202, 255),
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.blueAccent,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.lightbulb_outline,
            text: 'new story',
          ),
          GButton(
            icon: Icons.favorite_border,
            text: 'Library',
          ),
          GButton(
            icon: Icons.person,
            text: 'Proflie',
          )
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic>? response = [];
  HttpService _httpService = Get.put(HttpService());

  Future<List<dynamic>> fetchData() async {
    try {
      // await Future.delayed(Duration(seconds: 35));
      print('*' * 100);
      final data = await _httpService.getSummary();
      // print(data);
      return data;
    } catch (e) {
      print('An error occurred while fetching data: $e');
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((value) => {
      setState(() {
        response = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Discover',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //
              },
            ),
          ],
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey[400]!,
                    width: 1,
                  ),
                ),
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Enter text',
                    labelText: 'Text',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              const Text(
                'This app enables you to',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              informationCarousel(response!),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Your Free\nDaily Summary',
                        maxLines: 2, // Set maxLines to 2
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Image.asset(
                        'images/four_princess.jpeg',
                        width: 100,
                        height: 150,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Today For You',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                _buildCarousel1(response!),
                const SizedBox(
                  height: 30,
                ),
                // const Text(
                //   'Daily insights',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 25,
                //   ),
                // ),
                // _buildCarousel2('Carousel 2'),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'First Goal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                _buildCarousel1(response!),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Second Goal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                _buildCarousel1(response!),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Third goal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                _buildCarousel1(response!),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Challenges',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                //challengeCarousel('Carousel 3'),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Collections',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                _buildCarousel3('Carousel 3'),
              
            ],
          ),
        ));
  }

  Widget _buildCarousel1(List<dynamic> response) {
    var items = [];
    for (var elt in response) {
      final db_item = elt;
      List<dynamic> keypoints = db_item["keypoints"];
      String content = db_item["content"];
      String reading_age = db_item["reading_age"];
      String reading_time = db_item["reading_time"];
      String id = db_item["id"];
      Map<String, dynamic> book = Map<String, dynamic>.from(db_item["book"]);

      CardItem item = CardItem(
        content,
        reading_age,
        reading_time,
        'images/four_princess.jpeg',
        id,
        keyPoints: keypoints,
        book: book,
      );
      items.add(item);
    }

    return Container(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, _) => SizedBox(width: 12),
        itemBuilder: (BuildContext context, int index) {
          return ImageCard(
            item: items[index],
          );
        },
      ),
    );
  }

  Widget informationCarousel(List<dynamic> response) {
    var items = [];
    for (var elt in response) {
      final db_item = elt;
      List<dynamic> keypoints = db_item["keypoints"];
      String content = db_item["content"];
      String reading_age = db_item["reading_age"];
      String reading_time = db_item["reading_time"];
      String id = db_item["id"];
      Map<String, dynamic> book = Map<String, dynamic>.from(db_item["book"]);

      CardItem item = CardItem(
        content,
        reading_age,
        reading_time,
        'images/four_princess.jpeg',
        id,
        keyPoints: keypoints,
        book: book,
      );
      items.add(item);
    }
    return Container(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, _) => SizedBox(width: 12),
        itemBuilder: (BuildContext context, int index) {
          return ImageCard5(item: items[index]);
        },
      ),
    );
  }

  Widget _buildCarousel2(String title) {
    List<String> imagePaths = [
      'images/boy_scenery.jpeg',
      'images/princess_candy.jpeg',
      'images/four_princess.jpeg',
      'images/four_princess.jpeg',
      'images/boy_water.jpeg',
      'images/princess_bird.jpeg',
      'images/single_boy.jpeg',
    ];

    return Container(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        separatorBuilder: (context, _) => SizedBox(width: 12),
        itemBuilder: (BuildContext context, int index) {
          return ImageCard2(imagePath: imagePaths[index]);
        },
      ),
    );
  }

  Widget _buildCarousel3(String title) {
    List<String> imagePaths = [
      'images/boy_scenery.jpeg',
      'images/princess_candy.jpeg',
      'images/princess_candy.jpeg',
      'images/four_princess.jpeg',
      'images/boy_water.jpeg',
      'images/princess_bird.jpeg',
      'images/single_boy.jpeg',
    ];

    return Container(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        separatorBuilder: (context, _) => SizedBox(width: 12),
        itemBuilder: (BuildContext context, int index) {
          return ImageCard1(imagePath: imagePaths[index]);
        },
      ),
    );
  }

  Widget challengeCarousel(List<dynamic> response) {
    var items = [];
    // for (var elt in response) {
    //   final db_item = elt;
    //   List<dynamic> keypoints = db_item["keypoints"];
    //   String content = db_item["content"];
    //   String reading_age = db_item["reading_age"];
    //   String reading_time = db_item["reading_time"];
    //   String id = db_item["id"];
    //   Map<String, dynamic> book = Map<String, dynamic>.from(db_item["book"]);

    //   CardItem item = CardItem(
    //     id,
    //     content,
    //     reading_age,
    //     reading_time,
    //     '',// 'images/four_princess.jpeg',
    //     keyPoints: keypoints,
    //     book: book,
    //   );
    //   items.add(item);
    // }
    return Container(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, _) => SizedBox(width: 12),
        itemBuilder: (BuildContext context, int index) {
          return ImageCard(
            item: items[index],
          );
        },
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final CardItem item;
  ImageCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPage(item: item)),
        );
      },
      child: SizedBox(
        width: 200,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  padding: EdgeInsets.all(8),
                  // child: Text(
                  //   item.authorName,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 16,
                  //   ),
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                ),
              ),
              Expanded(
                flex: 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AspectRatio(
                      aspectRatio: 1 / 2,
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard1 extends StatelessWidget {
  final String imagePath;

  ImageCard1({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      margin: EdgeInsets.symmetric(horizontal: 1),
      child: AspectRatio(
          aspectRatio: 2 / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}

class ImageCard2 extends StatelessWidget {
  final String imagePath;

  ImageCard2({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      margin: EdgeInsets.symmetric(horizontal: 1),
      child: AspectRatio(
          aspectRatio: 2 / 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}

class ImageCard3 extends StatelessWidget {
  final CardItem item;
  const ImageCard3({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      margin: EdgeInsets.symmetric(horizontal: 1),
      child: AspectRatio(
          aspectRatio: 3 / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}

class ImageCard5 extends StatelessWidget {
  final CardItem item;
  
  const ImageCard5({required this.item});

  @override
  Widget build(BuildContext context) {
    print("image path: ${item.imagePath}");
    return SizedBox(
      width: 200,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: AspectRatio(
                  aspectRatio: 2 / 5,
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "AuthorName",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem {
  final String id;
  final List<dynamic> keyPoints;
  final String content;
  final String reading_age;
  final String reading_time;
  final String imagePath;
  final Map<String, dynamic> book;

  CardItem(
    this.content, 
    this.reading_age, 
    this.reading_time, 
    this.imagePath,
    this.id,
    {
      required this.keyPoints, 
      required this.book
    }
  );
}
