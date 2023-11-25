import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haircut/pages/Splashscreen.dart';
import 'package:haircut/pages/detail.dart';

import 'package:get/get.dart';
import 'package:haircut/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyCvmcDg9m_H5jYGnmnqf4YsZedz4huBCbU',
          appId: '1:512149688106:android:9877f6be40579475a15853',
          messagingSenderId: '512149688106',
          projectId: 'phone-authentication-618ef',
          storageBucket: 'phone-authentication-618ef.appspot.com',
        ))
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}
