import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String _message = '';
  final _formKey = GlobalKey<FormState>();
  bool _isLoggingIn = false;
  Color _greenColor = Color(0xff00D959);
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 130, 150, 0),
                    child: Text(
                      "Hello \n There",
                      style:
                          TextStyle(fontSize: 55, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(155, 171, 0, 0),
                    child: Text(
                      ".",
                      style: TextStyle(
                          color: Colors.green[500],
                          fontSize: 80,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 64,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
                child: TextFormField(
                  validator: validateEmail,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 1.5)),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600])),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
                child: TextFormField(
                  validator: validatePass,
                  obscureText: true,
                  controller: _passController,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 1.5)),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600])),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  _message,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: _greenColor),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 280,
                child: _isLoggingIn
                    ? CircularProgressIndicator(
                        strokeWidth: 2,
                        color: _greenColor,
                      )
                    : ElevatedButton(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 21),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: _greenColor,
                        ),
                        onPressed: () async {
                          setState(() {
                            _isLoggingIn = true;
                            _message = '';
                          });
                          if (_formKey.currentState!.validate()) {
                            try {
                              await _auth.signInWithEmailAndPassword(
                                  email: _emailController.text.trim(),
                                  password: _passController.text.trim());

                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  Routes.applePage, (route) => false);
                            } on FirebaseAuthException catch (e) {
                              switch (e.code) {
                                case 'invalid-email':
                                  _message = 'Error: Incorrect Email!';
                                  break;
                                case 'user-disabled':
                                  _message = 'Error: User disabled!';
                                  break;
                                case 'user-not-found':
                                  _message = 'Error: User not found!';
                                  break;
                                case 'wrong-password':
                                  _message = 'Error: Incorrect Password';
                                  break;
                              
                              }
                            }
                          }
                          setState(() {
                            _isLoggingIn = false;
                          });
                        },
                      ),
              ),
              SizedBox(
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't have an Account?"),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.registerScreen);
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: _greenColor),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'Email address cannot be empty!';
    }

    String pattern = r'\w+@\w+\.';
    RegExp regEx = RegExp(pattern);
    if (!regEx.hasMatch(formEmail)) return 'Invalid Email Address Format.';
    return null;
  }

  String? validatePass(String? formPass) {
    if (formPass == null || formPass.isEmpty) {
      return 'Password cannot be empty!';
    }
    return null;
  }
}
