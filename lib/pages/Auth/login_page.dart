import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>(); // Key to validate the form

  // Text editing controllers for form fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _loginUser() async {
    if (_formKey.currentState!.validate()) {
      // Validate the form fields
      String email = _emailController.text;
      String password = _passwordController.text;

      // Create a JSON payload to send to the backend
      Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };
      var url = Uri.parse('http://192.168.7.49:8000/account/auth');
      // Send login request to the backend API
      var response = await http.post(url,headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Login successful
        // Display a success message or navigate to the home screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful!'),
          ),
        );
      } else {
        // Login failed
        // Display an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please try again.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            // Add form field validation for email
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            // Add form field validation for password
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          ElevatedButton(
            child: Text('Login'),
            onPressed: _loginUser,
          ),
        ],
      ),
    );
  }
}
/* import 'package:flutter/material.dart';
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
 */

