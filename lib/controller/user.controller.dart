import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  int id;
  DateTime lastLogin;
  bool isSuperUser;
  String username;
  String email;
  bool isActive;
  List<String> preferedCategories;
  List<String> favoriteBooks;
  List<String> readingBooks;

  User(
    this.lastLogin,
    this.isSuperUser,
    this.username,
    this.email,
    this.isActive,
    this.preferedCategories,
    this.favoriteBooks,
    this.readingBooks,
    {required this.id,}
  );
}

class UserController extends GetxController {
  Rx<User> user = User(          
          DateTime.now(),
          false,
          '',
          '',
          false,
          [],
          [],
          [],
          id: 0,
  ).obs;

  Future<void> fetchUserInformation() async {
    print('========THIS IS ID============${user.value.id}');
    try {
      var response = await http.get(Uri.parse('http://192.168.7.49:8000/account/auth/?id=${user.value.id}'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        var id = data['id'];
        var username = data['username'];
        var email = data['email'];
        var lastLogin = DateTime.parse(data['last_login']);
        var preferedCategories = List<String>.from(data['preferedCategories']);
        var favoriteBooks = List<String>.from(data['favorite_books']);
        var readingBooks = List<String>.from(data['reading_books']);

        user.value = User(
          lastLogin,
          false,
          username,
          email,
          false,
          preferedCategories,
          favoriteBooks,
          readingBooks,
          id: id
        );
      }
    } catch (error) {
      print('Error fetching user information: $error');
    }
  }
}