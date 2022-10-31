import 'package:flutter/material.dart';

class MyProfilPage extends StatefulWidget {
  const MyProfilPage({Key? key}) : super(key: key);

  @override
  State<MyProfilPage> createState() => _MyProfilPageState();
}

class _MyProfilPageState extends State<MyProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profil'),
      ),
    );
  }
}
