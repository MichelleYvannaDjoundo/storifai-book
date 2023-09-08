import 'package:flutter/material.dart';

class Class1 extends StatefulWidget {
  @override
  _Class1State createState() => _Class1State();
}

class _Class1State extends State<Class1> {
  String data1 = "Hello from Class1";

  @override
  Widget build(BuildContext context) {
    return Class2(data1: data1);
  }
}

class Class2 extends StatelessWidget {
  final String data1;

  Class2({required this.data1});

  @override
  Widget build(BuildContext context) {
    // Use data1 in Class2
    return Text(data1);
  }
}

// Usage
void main() {
  runApp(MaterialApp(
    home: Class1(),
  ));
}
    // List<CardItem> item1 = [
    //   CardItem(
    //       {
    //         "Lorem ipsum dolor sit amet consectetur adipisicing elit.":
    //             "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, olestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis caecati tenetur iure eius earum ut molestias architecto voluptate aliquam lpa officia aut! Impedit sit sunt quaerat, odit,           tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,     quia. Quo neque error repudiandae fuga?",
    //         "Key":
    //             "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, olestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis caecati tenetur iure eius earum ut molestias architecto voluptate aliquam lpa officia aut! Impedit sit sunt quaerat, odit,           tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,     quia. Quo neque error repudiandae fuga?",
    //         "Key1":
    //             "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, olestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis caecati tenetur iure eius earum ut molestias architecto voluptate aliquam lpa officia aut! Impedit sit sunt quaerat, odit,           tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,     quia. Quo neque error repudiandae fuga?",
    //       }, //keypoints
    //       1, //time
    //       0, //
    //       imagePath: 'images/book_loop.jpg',
    //       authorName: 'Summarize books',
    //       category: 'Category 1'),
    // ];

    /*    List<CardItem> items = [
      CardItem(
          {
            "Lorem ipsum dolor sit amet consectetur adipisicing elit.":
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, olestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis caecati tenetur iure eius earum ut molestias architecto voluptate aliquam lpa officia aut! Impedit sit sunt quaerat, odit,           tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,     quia. Quo neque error repudiandae fuga?",
            "Lorem ipsum dolor sit amet consectetur adipisicing elit.":
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, olestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis caecati tenetur iure eius earum ut molestias architecto voluptate aliquam lpa officia aut! Impedit sit sunt quaerat, odit,           tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,     quia. Quo neque error repudiandae fuga?",
            "Lorem ipsum dolor sit amet consectetur adipisicing elit.":
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, olestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis caecati tenetur iure eius earum ut molestias architecto voluptate aliquam lpa officia aut! Impedit sit sunt quaerat, odit,           tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit,     quia. Quo neque error repudiandae fuga?",
          }, //keypoints
          0, //time
          0, //
          imagePath: 'images/book_loop.jpg',
          authorName: 'Summarize books',
          category: 'Category 1'),
      CardItem({
        "Lorem ipsum dolor sit amet consectetur adipisicing elit.": "",
        "Lorem ipsum dolor sit amet consectetur adipisicing elit.": "",
        "Lorem ipsum dolor sit amet consectetur adipisicing elit.": ""
      }, 0, 0,
          imagePath: 'images/idea.png',
          authorName: 'Generate new stories',
          category: 'Category 2'),
    ];*/