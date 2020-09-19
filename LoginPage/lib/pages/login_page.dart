import 'package:flutter/material.dart';
import '../global.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future navigateToSignUp(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignupPage()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: backGroundColor,
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    "Login",
                    style: titleTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image.asset('images/login_page_image.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: MyTextFormField(
                    hintText: 'Email',
                    isEmail: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: MyTextFormField(
                    hintText: 'Password',
                    isEmail: true,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: 278,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    margin: EdgeInsets.only(top: 200, left: 30, right: 30),
                    child: Container(
                      child: Text(
                        "Login",
                        style: buttonTextStyle,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New User?",
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        onTap: () {
                          navigateToSignUp(context);
                        },
                      )
                    ],
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
