import 'package:ashresume/pages/globals.dart';
import 'package:ashresume/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user.controller.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final UserController _userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Summaries ${_userController.user.value.favoriteBooks.length}'),
            Tab(text: 'Highlights'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              padding: EdgeInsets.all(16),
              children: _userController.user.value.favoriteBooks.map((book) {
                return GridTile(
                  child: Column(
                    children: [
                      Image.asset(
                        // book.imagePath,
                        // fit: BoxFit.cover,
                        ''
                      ),
                      SizedBox(height: 8),
                      Text(
                        book[0],
                        // book.author,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Center(
            child: Text('Highlights'),
          ),
        ],
      ),
    );
  }
}/*
class LibraryScreen extends StatefulWidget {
  final List<CardItem> addedToLib;

  const LibraryScreen({
    required this.addedToLib,
  });

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int itemNumber = addedToLib.length;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library '),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Summaries $itemNumber'),
            Tab(text: 'Highlights'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              padding: EdgeInsets.all(16),
              children: widget.addedToLib.map((item) {
                return GridTile(
                  child: Column(
                    children: [
                      Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "hkg kyk",
                        // item.original_content.val('author') as String,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Center(
            child: Text('Highlights'),
          ),
        ],
      ),
    );
  }
}

*/