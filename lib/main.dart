import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myinsta/pages/home_page.dart';
import 'package:flutter_myinsta/pages/signIn_page.dart';
import 'package:flutter_myinsta/pages/signUp_page.dart';
import 'package:flutter_myinsta/pages/splash_page.dart';

import 'model/pref_model.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => print('Firebase ishga tushti'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _startPage(){
    return StreamBuilder <User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context,snapshot){
          if(snapshot.hasData){
            Prefs.saveUserId(snapshot.data!.uid);
            return const SplashPage();
          }
          else{
            Prefs.removeUserId();
            return const SplashPage();
          }
        });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: _startPage(),
      routes: {
        SplashPage.id:(context) => const SplashPage(),
        SignInPage.id:(context) => const SignInPage(),
        SignUpPage.id:(context) => const SignUpPage(),
        HomePage.id:(context) => const HomePage()
      },
    );
  }
}


