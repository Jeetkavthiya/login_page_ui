import 'package:LoginPage/model.dart';
import 'package:LoginPage/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;

import '../global.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
            child: Stack(children: [
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Text(
                      "Sign Up",
                      style: titleTextStyle,
                    ),
                  ),
                  Container(
                    height: 200,
                    margin: EdgeInsets.only(top: 15),
                    child: Image.asset('images/welcome_page_image.png'),
                  ),
                  TestForm()
                ],
              ),
            ]),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 278,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 3),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: buttonColor,
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  Future navigateToLogin(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
  final _formKey = GlobalKey<FormState>();
  Model model = Model();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 25),
            child: MyTextFormField(
              hintText: 'Email',
              isEmail: true,
              validator: (String value) {
                if (!validator.isEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (String value) {
                model.email = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: MyTextFormField(
              hintText: 'Password',
              isPassword: true,
              validator: (String value) {
                if (value.length < 7) {
                  return 'Password should be minimum 7 characters';
                }
                _formKey.currentState.save();
                return null;
              },
              onSaved: (String value) {
                model.password = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: MyTextFormField(
              hintText: 'Confirm Password',
              isPassword: true,
              validator: (String value) {
                if (value.length < 7) {
                  return 'Password should be minimum 7 characters';
                } else if (model.password != null && value != model.password) {
                  print(value);
                  print(model.password);
                  return 'Password not matched';
                }
                return null;
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(model: this.model)));
              } else {
                return AlertDialog(
                  title: Text("Invalid Infornation"),
                );
              }
            },
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
                  "Sign Up",
                  style: buttonTextStyle,
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already User?",style: TextStyle(fontSize: 18),),
                GestureDetector(
                  child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  onTap: (){
                    navigateToLogin(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
