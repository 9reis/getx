import 'package:flutter/material.dart';

class GetX2 extends StatelessWidget {
  const GetX2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GET X',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Center(
        child: Text('Get X 2'),
      ),
    );
  }
}
