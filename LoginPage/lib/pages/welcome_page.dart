import 'package:LoginPage/pages/login_page.dart';
import 'package:LoginPage/pages/signup_page.dart';
import 'package:flutter/material.dart';
import '../global.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  Future navigateToLogin(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
  Future navigateToSignUp(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
  }

  @override 
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: backGroundColor,
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    "Welcome",
                    style: titleTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Image.asset('images/signup_page_image.png'),
                ),
                GestureDetector(
                  onTap: () {
                    navigateToLogin(context);
                  },
                  child: Container(
                    height: 60,
                    width: 278,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    margin: EdgeInsets.only(top: 250, left: 30, right: 30),
                    child: Container(
                      child: Text(
                        "Login",
                        style: buttonTextStyle,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    navigateToSignUp(context);
                  },
                  child: Container(
                    height: 60,
                    width: 278,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Container(
                      child: Text(
                        "Sign Up",
                        style: buttonTextStyle,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                )
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}