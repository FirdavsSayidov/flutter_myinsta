import 'package:flutter/material.dart';
import 'package:flutter_myinsta/pages/signUp_page.dart';

import 'home_page.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  static const String id = 'SignInPage';


  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: MediaQuery.of(context).size.height,
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
        child: Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
              Center(
                  child: Text('Instagram',style: TextStyle(color: Colors.white,fontSize: 45,fontFamily: 'Billabong'),)),
                    Container(height: 45,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white.withOpacity(0.3)),
                      child: TextField(controller: emailcontroller,
                        decoration: InputDecoration(
                        hintText: '  Email',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5))
                      ),),
                    ),
                SizedBox(height: 10,),
                    Container(height: 45,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white.withOpacity(0.3)),
                      child: TextField(obscureText: true,
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          hintText: '  Password',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5))

                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(onTap: (){
                      Navigator.pushReplacementNamed(context, HomePage.id);
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
      ),
    );
  }
}
