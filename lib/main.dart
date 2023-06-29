import 'package:flutter/material.dart';

import 'sobre_screen.dart';
import 'lista_person_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ListaPersonagensScreen(),
        '/about': (context) => SobreScreen(),
      },
    );
  }
}
