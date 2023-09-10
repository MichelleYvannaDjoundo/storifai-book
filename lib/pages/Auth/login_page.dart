import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                // Implement your login logic here
                String email = _emailController.text;
                String password = _passwordController.text;
                // Make API request to authenticate the user
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
/*import 'package:flutter/material.dart';
import 'package:flutter_login_template/flutter_login_template.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum _State {
  signIn,
  signUp,
  forgot,
  confirm,
  create,
}

class _LoginPageState extends State<LoginPage> {
  late LoginTemplateStyle style;
  _State state = _State.signIn;

  @override
  void initState() {
    style = LoginTemplateStyle.defaultTemplate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var logo = Icon(
      Icons.android_rounded,
      size: 80,
    );

    var signInPage = LoginTemplateSignInPage(
      logo: logo,
      style: style,
      onPressedSignIn: () {},
      onPressedSignUp: () {
        setState(() {
          state = _State.signUp;
        });
      },
      onPressedForgot: () {
        setState(() {
          state = _State.forgot;
        });
      },
      socialButtons: [
        // LoginTemplateSocialButton(
        //   text: 'Apple',
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.account_circle_sharp,
        //     size: 16,
        //     color: style.socialButtonTextStyle.color,
        //   ),
        //   style: style,
        // ),
        LoginTemplateSocialButton(
          text: 'Google',
          onPressed: () {},
          icon: Icon(
            Icons.android,
            size: 16,
            color: style.socialButtonTextStyle.color,
          ),
          style: style,
        )
      ],
      term: LoginTemplateTerm(
        style: style,
        onPressedTermOfService: () {},
        onPressedPrivacyPolicy: () {},
      ),
    );

    var signUpPage = LoginTemplateSignUpPage(
      logo: logo,
      style: style,
      onPressedSignIn: () {
        setState(() {
          state = _State.signIn;
        });
      },
      onPressedSignUp: () {
        setState(() {
          state = _State.confirm;
        });
      },
      term: LoginTemplateTerm(
        style: style,
        onPressedTermOfService: () {},
        onPressedPrivacyPolicy: () {},
      ),
    );

    var forgotPasswordPage = LoginTemplateForgotPasswordPage(
        logo: logo,
        style: style,
        onPressedNext: () {
          setState(() {
            state = _State.confirm;
          });
        });

    var confirmCodePage = LoginTemplateConfirmCodePage(
      logo: logo,
      style: style,
      onPressedNext: () {
        setState(() {
          state = _State.create;
        });
      },
      onPressedResend: () {},
    );

    var createPassword = LoginTemplateCreatePasswordPage(
      logo: logo,
      style: style,
      errorTextPassword:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.',
      onPressedNext: () {
        setState(() {
          state = _State.signIn;
        });
      },
    );

    Widget body;
    switch (state) {
      case _State.signUp:
        body = signUpPage;
        break;
      case _State.forgot:
        body = forgotPasswordPage;
        break;
      case _State.confirm:
        body = confirmCodePage;
        break;
      case _State.create:
        body = createPassword;
        break;
      case _State.signIn:
      default:
        body = signInPage;
        break;
    }

    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Color.fromARGB(255, 64, 93, 255)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: SingleChildScrollView(
          child: body,
        ),
      ),
    );
  }
}*/

/*

import 'package:ashresume/pages/quizz_page.dart';
import 'package:ashresume/pages/reading_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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
  double iconScale = 1.0;
  String? selectedAge;
  String? selectedTime;
  String? selectedLanguage;

  List<String> ageOptions = ['09 years', '15 years', '20 years'];
  List<String> timeOptions = ['03 min', '05 min', '15 min', '01 hr'];
  List<String> languageOptions = ['French', 'English', 'Spanish'];

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
                        text:
                            ' $name', // Print the value of the "name" attribute
                        style: TextStyle(
                          color: Colors.black, // Apply black color to the name
                          fontSize: 18, // Adjust the font size as desired
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KeyPointScreen(
                        keyPoints: widget.item.keyPoints,
                        index: i,
                      ),
                    ),
                  );
                },
              ),
              Divider(height: 1), // Add a Divider widget
            ],
          ),
        ),
      );
      index++; // Increment the index counter
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
                              // Handle sharing logic here
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
                SizedBox(height: 10),
                // Rest of the code...
                // ...
                // Display the list of keypoints here
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
*/