import 'package:flutter/material.dart';
import 'package:habi_pulia/SplashScreen/SplashPage.dart';

Future main() async {
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habi Apulia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashPage(),
    );
  }
}


