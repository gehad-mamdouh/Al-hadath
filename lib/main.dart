import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/splash_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
initialRoute:SplashScreen.routeName ,
      routes: {
      SplashScreen.routeName: (context) => SplashScreen(),
      }
    );
  }
}
