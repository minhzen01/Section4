import 'package:flutter/material.dart';
import './screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 18),
          button: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        fontFamily: 'Quicksand',
        primarySwatch: Colors.purple,
        errorColor: Colors.red,
        accentColor: Colors.blue,
        appBarTheme: AppBarTheme(
          toolbarTextStyle: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            )
          ).bodyText2, titleTextStyle: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
          ).headline6
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}

