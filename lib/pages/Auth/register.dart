import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: RegistrationForm(),
        ),
      ),
    );
  }
}
class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>(); // Key to validate the form

  // Text editing controllers for form fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      // Validate the form fields
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      var url = Uri.parse('https://192.168.7.49:8000/account/auth');
      // Create a JSON payload to send to the backend
      Map<String, dynamic> data = {
        'name': name,
        'email': email,
        'password': password,
      };

      // Send registration request to the backend API
      var response = await http.post(url,
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // Registration successful
        // Display a success message or navigate to the login screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration successful!'),
          ),
        );
      } else {
        // Registration failed
        // Display an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed. Please try again.'),
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
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            // Add form field validation
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            // Add form field validation for email
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                  .hasMatch(value!)) {
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
              if (value.length < 8) {
                return 'Password should be at least 8 characters long';
              }
              if (!RegExp(r'^(?=.*?[0-9]).{8,}$').hasMatch(value)) {
                return 'Password should contain at least one number';
              }
              return null;
            },
          ),
          ElevatedButton(
            child: Text('Register'),
            onPressed: _registerUser,
          ),
        ],
      ),
    );
  }
}