import 'package:ashresume/pages/history_summary.dart';
import 'package:flutter/material.dart';

class NewStoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'New stories',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
            ),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Create your own stories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              challengeCarousel('Carousel 3'),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Recently generated',
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

  Widget _buildCarousel3(String title) {
    List<String> imagePaths = [
      'images/boy_scenery.jpeg',
      'images/princess_candy.jpeg',
      'images/boy_lamp.jpeg',
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

  Widget challengeCarousel(String title) {
    List<CardItem> items = [
      CardItem(
          imagePath: 'images/boy_scenery.jpeg',
          authorName: 'You can generate histories from summaries',
          category: 'Category 1'),
      CardItem(
          imagePath: 'images/princess_candy.jpeg',
          authorName: 'You can generate histories of your choice',
          category: 'Category 2'),
    ];

    return Container(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, _) => SizedBox(width: 12),
        itemBuilder: (BuildContext context, int index) {
          return ImageCard(item: items[index]);
        },
      ),
    );
  }
}

class CardItem {
  final String imagePath;
  final String authorName;
  final String category;

  CardItem({
    required this.imagePath,
    required this.authorName,
    required this.category,
  });
}

class ImageCard extends StatelessWidget {
  final CardItem item;

  const ImageCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
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
              flex: 2,
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        item.authorName,
                        maxLines: 3,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HistoryPrompt()),
                      );
                    },
                    child: Text('Try it Now'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.fitWidth,
                  )),
            ),
          ],
        ),
      ),
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
