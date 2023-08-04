import 'package:flutter/material.dart';
import 'package:getx/getX1/pages1/home_page.dart';

class GetX1 extends StatelessWidget {
  const GetX1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage1(),
    );
  }
}

// Trata os dados que vai pegar na API do GIT
