// ignore_for_file: prefer_const_constructors

import 'package:blood_donation_app/firebase_options.dart';
import 'package:blood_donation_app/screens/add.dart';
import 'package:blood_donation_app/screens/home.dart';
import 'package:blood_donation_app/screens/update.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => HomeScreen(),
        'add': (context) => AddUser(),
        'update': (context) => UpdateUser(),
      },
      initialRoute: 'home',
    );
  }
}
