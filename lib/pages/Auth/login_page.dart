import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  Map<String, dynamic>? _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                String username = _usernameController.text;

                // Construct the request URL and body
                String url = 'http://192.168.174.49:8000/account/auth';
                Map<String, dynamic> body = {
                  'email': email,
                  'password': password,
                  'username': username,
                };

                // Make the API request
                http.post(Uri.parse(url), body: body).then((response) {
                  if (response.statusCode == 200) {
                    // Authentication was successful
                    // Parse the response JSON to retrieve account information
                    Map<String, dynamic> data = jsonDecode(response.body);
                    String userId = data['userId'];
                    String userName = data['userName'];
                    // Update the necessary fields in the app
                    setState(() {
                      _currentUser;
                      // = User(
                      //   id: userId,
                      //   name: userName,
                      //   booksRead: data['booksRead'],
                      //   favoriteBooks: data['favoriteBooks'],
                      // );
                    });
                    // You can also navigate to a new screen after successful login
                    Navigator.pushReplacementNamed(context, '/home');
                  } else if (response.statusCode == 401) {
                    // Authentication failed
                    // Show an error message to the user, e.g., using a Snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid email or password'),
                      ),
                    );
                  } else {
                    // Handle other error cases if necessary
                  }
                }).catchError((error) {
                  // Handle any error that occurred during the API request
                });
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => {Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),        )} ,
              child: Text('forgot password?')
            )
          ],
        ),
      ),
    );
  }
}
