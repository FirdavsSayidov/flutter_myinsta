import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
   SecondScreen({
    Key? key,
    required this.payload,
  }) : super(key: key);

  final String payload;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(' $payload followed you'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'sdsd',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
