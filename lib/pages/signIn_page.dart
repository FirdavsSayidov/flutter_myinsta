import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myinsta/pages/home_page.dart';
import 'package:flutter_myinsta/pages/signUp_page.dart';

import '../model/pref_model.dart';
import '../services/auth_services.dart';
import '../services/utils_services.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const String id = 'SignInPage';


  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  _doSignIn() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    if (email.isEmpty || password.isEmpty) return;

    setState(() {
      isLoading = true;
    });
    AuthService.signInUser(context, email, password).then((firebaseUser) =>
    {
      _getFireBaseUser(firebaseUser),
    });
  }

  _getFireBaseUser(User? firebaseUser) async {
    setState(() {
      isLoading = false;
    });
    if (firebaseUser != null) {
      await Prefs.saveUserId(firebaseUser.uid);
      Navigator.pushReplacementNamed(context, HomePage.id);
    } else {
      Utils.fireToast("Check your email or password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [

                Color.fromRGBO(193, 53, 132, 1) ,
                Color.fromRGBO(131, 58, 180, 1),
              ]
            )
          ),
          child: Stack(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text('Instagram',style: TextStyle(color: Colors.white,fontSize: 45,fontFamily: 'Billabong'),)),
                          Container(height: 45,padding: EdgeInsets.only(left: 10),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white.withOpacity(0.3)),
                            child: TextField(controller: emailController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5))
                              ),),
                          ),
                          SizedBox(height: 10,),
                          Container(height: 45,padding: EdgeInsets.only(left: 10),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white.withOpacity(0.3)),
                            child: TextField(obscureText: true,
                              style: TextStyle(color: Colors.white),
                              controller: passwordController,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5))

                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(onTap: (){
                            _doSignIn();
                          },
                            child: Container(margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 45,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1,color: Colors.white.withOpacity(0.4)
                                  )

                                // color: Colors.white.withOpacity(0)
                              ),
                              child: Center(child: Text('Sign In',style: TextStyle(color: Colors.white),)),
                            ),
                          )
                        ],)),

                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don`t have an account?',style: TextStyle(color: Colors.white)),
                      TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, SignUpPage.id);
                          }, child: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                    ],
                  )
                ],
              ),

              isLoading ?
                  CircularProgressIndicator() :

                  SizedBox.shrink()
            ],
          )
        ),
      ),
    );
  }
}
