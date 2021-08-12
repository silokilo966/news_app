import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _usernameController = TextEditingController();
  String _message = '';
  final _formKey = GlobalKey<FormState>();
  bool _isLoggingIn = false;
  Color _greenColor = Color(0xff00D959);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 130, 150, 0),
                    child: Text(
                      "Register \n Account",
                      style:
                          TextStyle(fontSize: 55, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(240, 171, 0, 0),
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
                  //validator: validateEmail,
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 1.5)),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600])),
                ),
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
              SizedBox(
                height: 20,
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
                          "Register",
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
                              final UserCredential user = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passController.text.trim(),
                              );
                              await firestore
                                  .collection("users")
                                  .doc("${user.user?.uid}")
                                  .set({
                                "username": _usernameController.text.trim(),
                                "email": _emailController.text.trim()
                              });

                              Navigator.of(context)
                                  .pushReplacementNamed(Routes.loginScreen);
                            } on FirebaseAuthException catch (e) {
                              switch (e.code) {
                                case 'email-already-in-use':
                                  _message = 'Error: Email already in use!';
                                  break;
                                case 'invalid-email':
                                  _message = 'Error: Invalid email adress!';
                                  break;
                                case 'operation-not-allowed':
                                  _message = 'Error: Something went wrong!';
                                  break;
                                case 'weak-password':
                                  _message = 'Error: Weak password!';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Already have an Account?"),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.loginScreen);
                      },
                      child: Text(
                        "Sign In",
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
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[_!@#\$&*~]).{8,}$';
    RegExp regEx = RegExp(pattern);
    if (!regEx.hasMatch(formPass))
      return '''
    Password must be atleast 8 characters,
    include an uppercase letter, number and symbol.
        ''';

    return null;
  }
}
