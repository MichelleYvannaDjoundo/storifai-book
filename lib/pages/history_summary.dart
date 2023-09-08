import 'package:flutter/material.dart';

class HistoryPrompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Generate your stories',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}

/*


}*/






// import 'package:ashresume/pages/book_summary.dart';
// import 'package:ashresume/pages/library_page.dart';
// import 'package:ashresume/pages/new_story.dart';
// import 'package:ashresume/pages/profile_page.dart';
// import 'package:ashresume/pages/repetition_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   static List<Widget> _widgetOptions = <Widget>[
//     HomeScreen(),
//     NewStoryScreen(),
//     LibraryScreen(),
//     RepetitionScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: GNav(
//         gap: 0.1,
//         backgroundColor: Colors.greenAccent,
//         color: Colors.white,
//         activeColor: Colors.white,
//         tabBackgroundColor: Color.fromARGB(255, 83, 167, 118),
//         tabs: const [
//           GButton(
//             icon: Icons.home,
//             text: 'Home',
//           ),
//           GButton(
//             icon: Icons.lightbulb_outline,
//             text: 'new story',
//           ),
//           GButton(
//             icon: Icons.favorite_border,
//             text: 'Library',
//           ),
//           GButton(
//             icon: Icons.person,
//             text: 'Proflie',
//           )
//         ],
//         selectedIndex: _selectedIndex,
//         onTabChange: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<CardItem> items = [
//     CardItem(
//         imagePath: 'images/boy_scenery.jpeg',
//         authorName: 'Author 1',
//         category: 'Category 1'),
//     CardItem(
//         imagePath: 'images/princess_candy.jpeg',
//         authorName: 'Author 2',
//         category: 'Category 2'),
//     CardItem(
//         imagePath: 'images/boy_lamp.jpeg',
//         authorName: 'Author 3',
//         category: 'Category 3'),
//     CardItem(
//         imagePath: 'images/boy_scenery.jpeg',
//         authorName: 'Author 4',
//         category: 'Category 4'),
//     CardItem(
//         imagePath: 'images/princess_bird.jpeg',
//         authorName: 'Author 5',
//         category: 'Category 5'),
//     CardItem(
//         imagePath: 'images/boy_scenery.jpeg',
//         authorName: 'Author 6',
//         category: 'Category 6'),
//     CardItem(
//         imagePath: 'images/boy_scenery.jpeg',
//         authorName: 'Author 7',
//         category: 'Category 7'),
//     CardItem(
//         imagePath: 'images/boy_scenery.jpeg',
//         authorName: 'Author 8',
//         category: 'Category 8'),
//   ];
//   List<CardItem> inform = [
//     CardItem(
//         imagePath: 'images/book_loop.jpg',
//         authorName: 'Summarize books',
//         category: 'Category 1'),
//     CardItem(
//         imagePath: 'images/idea.png',
//         authorName: 'Generate new stories',
//         category: 'Category 2'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Discover',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 60,
//             ),
//           ),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 //
//               },
//             ),
//           ],
//           centerTitle: false,
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(15),
//           child: ListView(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                     color: Colors.grey[400]!,
//                     width: 1,
//                   ),
//                 ),
//                 child: TextField(
//                   onChanged: (value) {},
//                   decoration: InputDecoration(
//                     hintText: 'Enter text',
//                     labelText: 'Text',
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               const Text(
//                 'This app enables you to',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//               ),
//               buildCarousel(
//                 inform,
//                 200,
//               ),
//               const SizedBox(
//                 height: 35,
//               ),
//               Container(
//                 padding: EdgeInsets.only(left: 15),
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Color.fromARGB(255, 120, 236, 182),
//                 ),
//                 child: Row(
//                   children: [
//                     const Text(
//                       'Your Free\nDaily Summary',
//                       maxLines: 2, // Set maxLines to 2
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 90,
//                     ),
//                     Image.asset(
//                       'images/four_princess.jpeg',
//                       width: 100,
//                       height: 150,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 35,
//               ),
//               const Text(
//                 'Today For You',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//               ),
//               buildCarousel(items, 400),
//               const SizedBox(
//                 height: 30,
//               ),
//               const Text(
//                 'Daily insights',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//               ),
//               buildCarousel(items, 400),
//               const SizedBox(
//                 height: 25,
//               ),
//               const Text(
//                 'First Goal',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               buildCarousel(items, 400),
//               const SizedBox(
//                 height: 25,
//               ),
//               const Text(
//                 'Second Goal',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               buildCarousel(items, 400),
//               const SizedBox(
//                 height: 25,
//               ),
//               const Text(
//                 'Third goal',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               buildCarousel(items, 400),
//               const SizedBox(
//                 height: 25,
//               ),
//               const Text(
//                 'Challenges',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               buildCarousel(items, 400),
//               const SizedBox(
//                 height: 25,
//               ),
//               const Text(
//                 'Collections',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               buildCarousel(items, 400),
//             ],
//           ),
//         ));
//   }

//   Widget _buildCarousel1(CardItem) {
//     return Container(
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: items.length,
//         separatorBuilder: (context, _) => SizedBox(width: 12),
//         itemBuilder: (BuildContext context, int index) {
//           return ImageCard(item: items[index]);
//         },
//       ),
//     );
//   }
// }

// class ImageCard extends StatelessWidget {
//   final CardItem item;

//   const ImageCard({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DetailsPage(item: item)),
//         );
//       },
//       child: SizedBox(
//         width: 200,
//         child: Container(
//           height: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.grey[200],
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Expanded(
//                 flex: 5,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: AspectRatio(
//                     aspectRatio: 2 / 5,
//                     child: Image.asset(
//                       item.imagePath,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   padding: EdgeInsets.all(8),
//                   child: Text(
//                     item.authorName,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   /*Widget ImageCard({required item}) {
//   return InkWell(
//     onTap: () {
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => DetailsPage(item: item)),
//       // );
//     },
//     child: SizedBox(
//       width: 200,
//       child: Container(
//         height: 200,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.grey[200],
//         ),
//         margin: EdgeInsets.symmetric(horizontal: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               flex: 5,
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: AspectRatio(
//                     aspectRatio: 2 / 5,
//                     child: Image.asset(
//                       item.imagePath,
//                       fit: BoxFit.cover,
//                       height: 50,
//                       width: 50,
//                     ),
//                   )),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 padding: EdgeInsets.all(8),
//                 child: Text(
//                   item.authorName,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
//   }*/

//   Widget buildCarousel(
//     List<CardItem> items,
//     double height,
//   ) {
//     return Container(
//       height: height,
//       width: 500,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: items.length,
//         separatorBuilder: (context, _) => SizedBox(width: 12),
//         itemBuilder: (BuildContext context, int index) {
//           return ImageCard(item: items[index]);
//         },
//       ),
//     );
//   }
// }

// class CardItem {
//   final String imagePath;
//   final String authorName;
//   final String category;

//   CardItem({
//     required this.imagePath,
//     required this.authorName,
//     required this.category,
//   });
// }
