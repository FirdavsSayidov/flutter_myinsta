import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_myinsta/pages/signIn_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String id = "SplashPage";

  @override
  State<SplashPage> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTimer();
  }initTimer(){
    Timer(
        Duration(seconds: 2),(){
      _callNextPage();
    }
    );
  }
  _callNextPage(){
    Navigator.pushReplacementNamed(context, SignInPage.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
         gradient: LinearGradient(
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           colors: [
             Color.fromRGBO(193, 53, 132, 1),
             Color.fromRGBO(131, 58, 180, 1),
           ]
         )
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Center(
              child: Text('Instagram',style: TextStyle(fontFamily: 'Billabong',color: Colors.white,fontSize: 45),),
            )),
            Text('All rights reserved',style: TextStyle(color: Colors.white),),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
