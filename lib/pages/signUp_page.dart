import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myinsta/pages/signIn_page.dart';

import '../model/pref_model.dart';
import '../services/auth_services.dart';
import '../services/utils_services.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = 'SignUpPage';


  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var fullnamecontroller = TextEditingController();
    var conpasswordcontroller = TextEditingController();

    var isLoading = false;

    _doLogin(){
      String name = fullnamecontroller.text.toString().trim();
      String email = emailcontroller.text.toString().trim();
      String password = passwordcontroller.text.toString().trim();
      String confirm = conpasswordcontroller.text.toString().trim();
      if(name.isEmpty || email.isEmpty || password.isEmpty) return;
      if(password != confirm){Utils.fireToast('Parol bilan Confirm parol bir xil emas');return;}
      final bool emailValid =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if(emailValid) {
        Utils.emailvalidToast("To`gri email kiriting!");
      }
        RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
        if (password.isEmpty) {
          Utils.passwordvalidToast('Please enter password');
        } else {
          if (!regex.hasMatch(password)) {
           Utils.passwordvalidToast('Enter valid password') ;
          } else {
            return null;
          }
        }


      setState(() {
        isLoading = true;
      });
      AuthService.signUpUser(context, name, email, password).then((firebaseUser) =>
      {
        _getFirebaseUser(firebaseUser),
      });
    }
    void _getFirebaseUser(User? firebaseUser) async {
      setState(() {
        isLoading = false;
      });
      if(firebaseUser != null){
        await Prefs.saveUserId(firebaseUser.uid);
        Navigator.pushReplacementNamed(context, HomePage.id);
      }
     // else{Utils.fireToast('check all information');}
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [

                    Color.fromRGBO(193, 53, 132, 1) ,
                    Color.fromRGBO(131, 58, 180, 1),
                  ]
              )
          ),
          child: Column(//mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Stack(
                    children: [
                      Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text('Instagram',style: TextStyle(color: Colors.white,fontSize: 45,fontFamily: 'Billabong'),)),
                          Container(height: 45,padding: EdgeInsets.only(left: 10),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white.withOpacity(0.3)),
                            child: TextField(controller: fullnamecontroller,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(border: InputBorder.none,
                                  hintText: 'FullName',
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5))
                              ),),
                          ),
                          SizedBox(height: 10,),
                          Container(height: 45,padding: EdgeInsets.only(left: 10),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white.withOpacity(0.3)),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: emailcontroller,
                              decoration: InputDecoration(border: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5))

                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(height: 45,padding: EdgeInsets.only(left: 10),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white.withOpacity(0.3)),
                            child: TextField(style: TextStyle(color: Colors.white),
                              obscureText: true,
                              controller: passwordcontroller,
                              decoration: InputDecoration(border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5))

                              ),
                            ),
                          ),SizedBox(height: 10,),
                          Container(height: 45,padding: EdgeInsets.only(left: 10),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white.withOpacity(0.3)),
                            child: TextField(obscureText: true,style: TextStyle(color: Colors.white),
                              controller: conpasswordcontroller,
                              decoration: InputDecoration(border: InputBorder.none,

                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5))

                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){
                           _doLogin();
                          },
                            child: Container(margin: EdgeInsets.symmetric(horizontal: 20),
                              height: 45,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1,color: Colors.white.withOpacity(0.4)
                                  )

                                // color: Colors.white.withOpacity(0)
                              ),
                              child: Center(child: Text('Sign Up',style: TextStyle(color: Colors.white),)),
                            ),
                          )
                        ],),

                      isLoading ?
                          const CircularProgressIndicator():
                          SizedBox.shrink()
                    ],
                  )),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don`t have an account?',style: TextStyle(color: Colors.white)),
                  TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, SignInPage.id);
                      }, child: Text('Sign In',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
