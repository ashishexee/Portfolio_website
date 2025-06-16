import 'package:flutter/material.dart';
import 'package:portfolio/PortfolioScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ashishexee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF1E1E1E),
      ),
      home: PortfolioScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
