import 'package:flutter/material.dart';
import 'package:marlo_task/Mobile/Controller/bottom_navigation_controller.dart';
import 'package:marlo_task/Mobile/Controller/home_controller.dart';
import 'package:marlo_task/Mobile/View/bottom_navigation_bar.dart';
// import 'package:marlo_task/Web/View/screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavigationBarController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomNavigationScreen(),
        // home: WebScreen(),
      ),
    );
  }
}
