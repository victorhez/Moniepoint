import 'package:flutter/material.dart';

import 'features/dashboard/presentations/screens/dashboard_screen.dart';
import 'features/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashBoard()
    );
  }
}


